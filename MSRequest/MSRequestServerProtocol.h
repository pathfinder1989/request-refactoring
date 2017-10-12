//
//  MSRequestServerProtocol.h
//  MSRequestDemo
//
//  Created by meishi on 12/10/2017.
//  Copyright © 2017 Kangbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MSRequestServerProtocol <NSObject>

/** 开发环境 */
@property (nonatomic, strong, readonly) NSString *urlForDevelop;

/** 生产环境 */
@property (nonatomic, strong, readonly) NSString *urlForRelease;
@end
