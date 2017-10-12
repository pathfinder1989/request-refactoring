//
//  MSRequest.m
//  MSRequestDemo
//
//  Created by meishi on 28/08/2017.
//  Copyright © 2017 Kangbo. All rights reserved.
//

#import "MSRequest.h"
#import "MSRequestManager.h"
#import "MSRequestConfig.h"

@interface MSRequest ()
@property(nonatomic, strong, readwrite, nullable) NSString *responseString;
@property(nonatomic, strong, readwrite, nullable) id responseJSONObject;
@end

@implementation MSRequest

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isHandleDNS = YES;
    }
    return self;
}

- (void)startRequest
{
    [[MSRequestManager sharedInstance] startWithRequest:self];
}
- (void)cancelRequest
{
    [[MSRequestManager sharedInstance] cancelWithRequest:self];
}

- (void)startRequestWithCompletion:(MSRequestCompletion _Nullable )completion
{
    [self setRequestCompletion:completion];
    [self startRequest];
}

- (void)setRequestCompletion:(MSRequestCompletion _Nullable )completion
{
    _requestCompletion = completion;
}

- (NSUInteger)requestID
{
    return self.dataTask.taskIdentifier;
}

- (void)setResponseData:(NSData *)responseData
{
    if (responseData == nil) {
        self.isSuccess = NO;
        self.responseError = [NSError errorWithDomain:@"json error" code:-190999 userInfo:nil];
        return;
    }
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    self.responseString = responseStr;
    NSError *errorr;
    id rValue = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&errorr];
    self.responseJSONObject = rValue;
}

- (void)clearRequestCompletion
{
    self.requestCompletion = nil;
}

#pragma mark -

- (NSTimeInterval)requestTimeoutInterval
{
    return 60;
}

- (NSString *)requestHost
{
    return [MSRequestConfig sharedInstance].apiUrlHost;
}

@end
