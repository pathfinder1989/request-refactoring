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
@property(nonatomic, assign, readwrite) MSApiServerType serverType;
@property(nonatomic, strong, readwrite) NSString *apiUrlHost;
@property(nonatomic, strong) MSRequestServer *defaultServer;

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
        
    }
    return self;
}

- (void)configServerType:(MSApiServerType)type
{
    self.serverType = type;
}

- (void)configServer:(id<MSRequestServerProtocol>)server
{
    self.defaultServer = server;
}

- (NSString *)apiUrlHost
{
    return [self urlPathWithRequestServer:self.defaultServer];
}

- (NSString *)urlPathWithRequestServer:(MSRequestServer *)server
{
    switch (self.serverType) {
        case MSApiServerTypeDevelop:
        {
            return [server urlForDevelop];
        }
            break;
        case MSApiServerTypeRelease:
        {
            return [server urlForRelease];
        }
            break;
            
        default:
            return [server urlForRelease];
            break;
    }
}
@end
