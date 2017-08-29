//
//  MSDevice.m
//  MSRequestDemo
//
//  Created by meishi on 29/08/2017.
//  Copyright © 2017 Kangbo. All rights reserved.
//

#import "MSDevice.h"
#import <UIKit/UIKit.h>

@implementation MSDevice

+ (BOOL)isIPad
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}

+ (NSString *)systemVersion
{
    return [[UIDevice currentDevice] systemVersion];
}

@end
