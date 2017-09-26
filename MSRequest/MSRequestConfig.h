//
//  MSRequestConfig.h
//  MSRequestDemo
//
//  Created by meishi on 28/08/2017.
//  Copyright © 2017 Kangbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSRequest-Header.h"

/**
 *  此处只区分 测试 和 开发环境 （可扩展预发，部分区域等环境），如若有其他环境，则扩展协议 和 枚举
 */
typedef NS_ENUM (NSUInteger, MSApiServerType) {
    /** 测试环境 */
    MSApiServerTypeDevelop,
    /** 生产环境 */
    MSApiServerTypeRelease,
    /** ....... */
};

@class MSRequestServer;

/** api请求配置类，用于网络请求的相关配置 */
@interface MSRequestConfig : NSObject

+ (instancetype)sharedInstance;

/** host 主机地址 */
@property(nonatomic, strong, readonly) NSString *apiUrlHost;

- (void)configServerType:(MSApiServerType)type;
- (void)configServer:(MSRequestServer *)server;
@end
