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

@interface MSRequestManager ()
@property(nonatomic, strong) AFHTTPSessionManager *httpSessionManager;
@property(nonatomic, strong) NSMutableDictionary *requestDictionary;
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
    _httpSessionManager = [AFHTTPSessionManager manager];
    _httpSessionManager.operationQueue.maxConcurrentOperationCount = 9;
}

- (void)startWithRequest:(MSRequest *)request
{
    //host 和 URL
    //配置请求公共参数
    //其他参数
    
    NSString *requestURLPath = @"";
    NSString *requestURLHost = @"";
    NSString *requestURL = [NSString stringWithFormat:@"%@%@",requestURLHost, requestURLPath];
    NSDictionary *requestParams = nil;
    
    //AFHTTPSessionManager *httpSessionManager = [AFHTTPSessionManager manager];
    AFHTTPRequestSerializer *requestSerializer = [[AFHTTPRequestSerializer alloc] init];
    AFHTTPResponseSerializer *responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    responseSerializer.acceptableContentTypes = [responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    _httpSessionManager.responseSerializer = responseSerializer;
    _httpSessionManager.requestSerializer = requestSerializer;
    
    __weak typeof(self) weakself = self;
    
    NSURLSessionDataTask *dataTask = [_httpSessionManager POST:requestURL parameters:requestParams progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
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
}


- (void)cancelWithRequest:(MSRequest *)request
{
    
}


#pragma mark -

- (NSString *)requestKey:(NSURLSessionDataTask *)task
{
    return [NSString stringWithFormat:@"%lu",task.taskIdentifier];
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
