//
//  MSRequest.m
//  MSRequestDemo
//
//  Created by meishi on 28/08/2017.
//  Copyright © 2017 Kangbo. All rights reserved.
//

#import "MSRequest.h"
#import "MSRequestManager.h"

@interface MSRequest ()
@property(nonatomic, strong, readwrite, nullable) NSString *responseString;
@property(nonatomic, strong, readwrite, nullable) id responseJSONObject;
@end

@implementation MSRequest

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
//- (id _Nullable )requestParameters{
//    return nil;
//}
//
//- (MSRequestMethod)requestMethod{
//    return MSRequestMethodGet;
//}
//- (NSString *_Nonnull)requestUrl{
//    return @"";
//}
//
//- (NSString *_Nonnull)requestHost{
//    return @"";
//}
//
//- (NSString *_Nullable)requestUserAgent{
//    return @"";
//}
@end
