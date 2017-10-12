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
    [paramsDictionary setObject:@"iphone" forKey:@"source"];
    
    
//    NSString *lat = [NSString stringWithFormat:@"%@",[[MSUserDefaults standardUserDefaults] valueForKey:kUserLatitude]];
//    if(!MSStringisEmpty(lat)){
//        [self.request setPostValue:lat forKey:@"lat"];
//    }
//    NSString *lon = [NSString stringWithFormat:@"%@",[[MSUserDefaults standardUserDefaults] valueForKey:kUserLongitude]];
//    if(!MSStringisEmpty(lon)){
//        [self.request setPostValue:lon forKey:@"lon"];
//    }
    
    return paramsDictionary;
}

@end
