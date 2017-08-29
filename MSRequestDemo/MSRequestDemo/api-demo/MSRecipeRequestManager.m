//
//  MSRecipeRequestManager.m
//  MSRequestDemo
//
//  Created by meishi on 29/08/2017.
//  Copyright © 2017 Kangbo. All rights reserved.
//

#import "MSRecipeRequestManager.h"
#import "MSRequest.h"

@implementation MSRecipeRequestManager

- (MSRequest *)tempRequest
{
    MSRequest *request = [MSRequest new];
    request.requestUrl = @"";
    request.requestHost = @"";
    return request;
}

- (void)loadRecipeListWithKeyWords:(NSString *)keyword Completion:(MSRequestCompletion)completion
{
    MSRequest *request = [self tempRequest];
    request.requestParameters = @{};
    [request startRequestWithCompletion:^(__kindof MSRequest *request) {
        
    }];
}

@end


@implementation MSRecipeRequest

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

- (void)loadRecipeDetailWithRecipeID:(NSString *)recipeID Completion:(MSRequestCompletion)completion
{
    [self startRequestWithCompletion:completion];
}
@end
