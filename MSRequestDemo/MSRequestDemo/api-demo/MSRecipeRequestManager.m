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

- (MSRequest *)recipeModuleRequest
{
    MSRequest *request = [MSRequest new];
    request.requestUrl = @"";
    request.requestHost = @"";
    return request;
}

- (void)loadRecipeListWithKeyWords:(NSString *)keyword Completion:(MSRequestCompletion)completion
{
    MSRequest *request = [self recipeModuleRequest];
    request.requestParameters = @{@"k" : keyword};
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

- (id _Nullable )requestParameters{
    return @{@"id" : @"1853504"};
}

- (NSString *_Nonnull)requestUrl{
    return @"v6/recipe_detail_new.php";
}

- (NSString *_Nonnull)requestHost{
    return @"https://t.api.meishi.cc/";
}

- (void)loadRecipeDetailWithRecipeID:(NSString *)recipeID Completion:(MSRequestCompletion)completion
{
    self.requestParameters = @{@"id" : recipeID};
    [self startRequestWithCompletion:completion];
}
@end
