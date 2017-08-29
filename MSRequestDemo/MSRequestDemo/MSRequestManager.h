//
//  MSRequestManager.h
//  MSRequestDemo
//
//  Created by meishi on 29/08/2017.
//  Copyright © 2017 Kangbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MSRequest;
/** 对request操作的处理 添加 移除等 */
@interface MSRequestManager : NSObject

+ (instancetype)sharedInstance;

- (void)startWithRequest:(MSRequest *)request;
- (void)cancelWithRequest:(MSRequest *)request;
@end
