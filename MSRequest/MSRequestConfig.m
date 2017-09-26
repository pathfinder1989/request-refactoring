//
//  MSRequestConfig.m
//  MSRequestDemo
//
//  Created by meishi on 28/08/2017.
//  Copyright © 2017 Kangbo. All rights reserved.
//

#import "MSRequestConfig.h"
#import "MSRequestServer.h"

@interface MSRequestConfig ()
/** 配置项目运行环境 */
@property(nonatomic, assign) MSServerType serverType;
@property(nonatomic, strong, readwrite) NSString *apiUrlHost;
@end

@implementation MSRequestConfig

+ (instancetype)sharedInstance
{
    static MSRequestConfig *_instance;
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
    
}

- (void)configServerType:(MSServerType)type
{
    self.serverType = type;
    switch (type) {
        case MSServerTypeDevelop:
        {
//            self.apiUrlHost = self
        }
            break;
        case MSServerTypeRelease:
        {
            
        }
            break;
            
        default:
            break;
    }
}
//
//- (NSString *)apiUrlHost
//{
//    return @"https://t.api.meishi.cc/";
//}
@end
