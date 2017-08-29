//
//  MSRequest.h
//  MSRequestDemo
//
//  Created by meishi on 28/08/2017.
//  Copyright © 2017 Kangbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSRequest-Header.h"
#import "MSRequestProtocol.h"

@interface MSRequest : NSObject <MSRequestProtocol>

@property(nonatomic, assign, readonly) NSUInteger requestID;

@property(nonatomic, strong) NSURLSessionDataTask * _Nonnull dataTask;

/** response-data */
@property(nonatomic, strong, nullable) NSData *responseData;
/** response-string */
@property(nonatomic, strong, readonly, nullable) NSString *responseString;
/** response-json-obj */
@property(nonatomic, strong, readonly, nullable) id responseJSONObject;
@property(nonatomic, strong) NSError * _Nullable responseError;
/** response-status-code 请求响应码 */ //tempk 除了系统的需要自定义? 除了包含http本身状态码还应该有自定义状态码
@property(nonatomic, assign, readonly) NSInteger responseStatusCode;
/** 请求成功与否的唯一标志 */
@property(nonatomic, assign) BOOL isSuccess;

@property(nonatomic, copy) MSRequestCompletion _Nullable requestCompletion;

/** 目前请求只支持回调，如果有用到delete 再进行扩展 */
- (void)startRequestWithCompletion:(MSRequestCompletion _Nullable )completion;
- (void)cancelRequest;

#pragma mark -

@property(nonatomic, strong) id _Nullable requestParameters;
@property(nonatomic, assign) MSRequestMethod requestMethod;

@property(nonatomic, strong) NSString * _Nonnull requestUrl;
@property(nonatomic, strong) NSString * _Nonnull requestHost;

- (id _Nullable )requestParameters;

- (MSRequestMethod)requestMethod;

/** api请求的URL后缀 */
- (NSString *_Nonnull)requestUrl;
/** api请求的URLhost */
- (NSString *_Nonnull)requestHost;

- (NSString *_Nullable)requestUserAgent;
@end
