//
//  MSDevice.h
//  MSRequestDemo
//
//  Created by meishi on 29/08/2017.
//  Copyright © 2017 Kangbo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**设备信息的一些封装 */
@interface MSDevice : NSObject

+ (BOOL)isIPad;
+ (NSString *)systemVersion;
@end
