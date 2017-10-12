//
//  MSRequestManager.m
//  MSRequestDemo
//
//  Created by meishi on 29/08/2017.
//  Copyright © 2017 Kangbo. All rights reserved.
//

#import "MSRequestManager.h"
#import "MSRequest.h"
#import "AFNetworking.h"
#import "MSRequestConfig.h"
#import "MSHappyDnsManager.h"

@interface MSRequestManager ()
@property(nonatomic, strong) AFHTTPSessionManager *httpSessionManager;
@property(nonatomic, strong) NSMutableDictionary *requestDictionary;
@property(nonatomic, strong) MSRequestConfig *config;
@end

@implementation MSRequestManager

+ (instancetype)sharedInstance
{
    static MSRequestManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization
{
    _config = [MSRequestConfig sharedInstance];
    _httpSessionManager = [AFHTTPSessionManager manager];
    _httpSessionManager.operationQueue.maxConcurrentOperationCount = 9;
    //AFSSLPinningModeNone, 是默认的认证方式，只会在系统的信任的证书列表中对服务端返回的证书进行验证
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    policy.allowInvalidCertificates = YES;
    [policy setValidatesDomainName:NO];
    _httpSessionManager.securityPolicy = policy;
}

- (NSString *)urlFullPathForRequest:(MSRequest *)request
{
    NSString *host = request.requestHost;
    NSString *path = request.requestUrl;
    if ([path hasPrefix:@"http"]) {
        return path;
    }
//    if (host.length <= 0) {
//        host = _config.apiUrlHost;
//    }
    NSString *fullUrlPath = [NSString stringWithFormat:@"%@%@",host, path];
    
    return fullUrlPath;
}

- (NSDictionary *)paramsForRequest:(MSRequest *)request
{
    return request.requestParameters;
}

- (void)startWithRequest:(id<MSRequestProtocol>)tRequest;
{
    MSRequest *request = tRequest;
    NSString *requestURLFullPath = [self urlFullPathForRequest:request];
//    if (request.isHandleDNS) {
//        NSURL *newUrl = [MSHappyDnsManager handleHappyDnsWithDomainUrl:[NSURL URLWithString:requestURLFullPath]];
//        if (newUrl != nil) {
//            requestURLFullPath = newUrl.absoluteString;
//        }
//    }
//    NSLog(@"requestURLFullPath--: %@", requestURLFullPath);
    
    NSDictionary *requestParams = [self paramsForRequest:request];
    
    //请求
    AFHTTPRequestSerializer *requestSerializer = [[AFHTTPRequestSerializer alloc] init];
    requestSerializer.timeoutInterval = [request requestTimeoutInterval];
    
    if ([request respondsToSelector:@selector(requestUserAgent)]) {
        NSString *userCustomAgent = [tRequest requestUserAgent];
        if (userCustomAgent != nil) {
            [requestSerializer setValue:userCustomAgent forHTTPHeaderField:@"User-Agent"];
        }
    }
    
    //解析
    AFHTTPResponseSerializer *responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    responseSerializer.acceptableContentTypes = [responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    _httpSessionManager.responseSerializer = responseSerializer;
    _httpSessionManager.requestSerializer = requestSerializer;
    
    __weak typeof(self) weakself = self;
    
    NSURLSessionDataTask *dataTask = [_httpSessionManager POST:requestURLFullPath parameters:requestParams progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [weakself handleRequestResponseResultWithTask:task responseObj:responseObject error:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [weakself handleRequestResponseResultWithTask:task responseObj:nil error:error];
    }];
    request.dataTask = dataTask;
    [self addRequestToRecords:request];
}

- (void)handleRequestResponseResultWithTask:(NSURLSessionDataTask *)task responseObj:(id)responseObj error:(NSError *)error
{
    NSString *taskKey = [self requestKey:task];
    MSRequest *request = self.requestDictionary[taskKey];
    
    if (error != nil) {
        request.isSuccess = NO;
        request.responseError = error;
        if (request.requestCompletion) {
            request.requestCompletion(request);
        }
    }
    else{
        request.isSuccess = YES;
        request.responseData = responseObj;
        if (request.requestCompletion) {
            request.requestCompletion(request);
        }
    }
    [self removeRequestFromRecords:request];
    [request clearRequestCompletion];
}

- (void)cancelWithRequest:(id<MSRequestProtocol>)tRequest
{
    MSRequest *request = tRequest;
    [request clearRequestCompletion];
}


#pragma mark -

- (NSString *)requestKey:(NSURLSessionDataTask *)task
{
    return [NSString stringWithFormat:@"%lu",(unsigned long)task.taskIdentifier];
}

- (void)addRequestToRecords:(MSRequest *)request
{
    if (request != nil) {
        NSString *key = [self requestKey:request.dataTask];
        if (key.length != 0 && request != nil) {
            [self.requestDictionary setObject:request forKey:key];
        }
    }
}

- (void)removeRequestFromRecords:(MSRequest *)request
{
    NSString *key = [self requestKey:request.dataTask];
    if (key.length != 0) {
        [self.requestDictionary removeObjectForKey:key];
    }
}

- (NSMutableDictionary *)requestDictionary
{
    if (!_requestDictionary) {
        _requestDictionary = [NSMutableDictionary new];
    }
    return _requestDictionary;
}

@end
