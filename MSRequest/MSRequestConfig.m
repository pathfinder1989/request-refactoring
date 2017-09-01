//
//  MSRequestConfig.m
//  MSRequestDemo
//
//  Created by meishi on 28/08/2017.
//  Copyright © 2017 Kangbo. All rights reserved.
//

#import "MSRequestConfig.h"

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

- (NSString *)apiUrlHost
{
    return @"https://t.api.meishi.cc/";
}
@end
