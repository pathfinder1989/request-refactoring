//
//  MSRequestCommonParams.m
//  MSRequestDemo
//
//  Created by meishi on 29/08/2017.
//  Copyright © 2017 Kangbo. All rights reserved.
//

#import "MSRequestCommonParams.h"

@implementation MSRequestCommonParams

+ (NSDictionary *)commonParams
{
    NSMutableDictionary *paramsDictionary = [NSMutableDictionary new];
    
    [paramsDictionary setObject:@"json" forKey:@"format"];
    
    return paramsDictionary;
}

@end
