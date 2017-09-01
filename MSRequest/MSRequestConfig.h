//
//  MSRequestConfig.h
//  MSRequestDemo
//
//  Created by meishi on 28/08/2017.
//  Copyright © 2017 Kangbo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 api请求配置类，用于网络请求的相关配置
 */
@interface MSRequestConfig : NSObject

+ (instancetype)sharedInstance;

/** host 主机地址 */
@property(nonatomic, strong) NSString *apiUrlHost;
@end
