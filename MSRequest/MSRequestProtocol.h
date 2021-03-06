//
//  MSRequestProtocol.h
//  MSRequestDemo
//
//  Created by meishi on 29/08/2017.
//  Copyright © 2017 Kangbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MSRequestProtocol <NSObject>
@optional
- (id _Nullable )requestParameters;

/** api请求的URL后缀 */
- (NSString *_Nonnull)requestUrl;
/** api请求的URLhost */
- (NSString *_Nonnull)requestHost;

- (NSString *_Nullable)requestUserAgent;
- (NSTimeInterval)requestTimeoutInterval;

/** 请求头设置 */
- (NSDictionary<NSString *, NSString *> *_Nullable)requestHeaderFieldValueDictionary;
@end
