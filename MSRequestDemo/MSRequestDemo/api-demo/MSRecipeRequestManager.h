//
//  MSRecipeRequestManager.h
//  MSRequestDemo
//
//  Created by meishi on 29/08/2017.
//  Copyright © 2017 Kangbo. All rights reserved.
//

#import "MSRequestManager.h"
#import "MSRequest.h"

@interface MSRecipeRequestManager : MSRequestManager

- (void)loadRecipeListWithKeyWords:(NSString *)keyword Completion:(MSRequestCompletion)completion;
@end



@interface MSRecipeRequest : MSRequest

- (void)loadRecipeDetailWithRecipeID:(NSString *)recipeID Completion:(MSRequestCompletion)completion;
@end
