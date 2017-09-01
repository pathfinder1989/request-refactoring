//
//  RecipeViewController.m
//  MSRequestDemo
//
//  Created by meishi on 2017/9/1.
//  Copyright © 2017年 Kangbo. All rights reserved.
//

#import "RecipeViewController.h"
#import "MSRecipeRequestManager.h"

@interface RecipeViewController ()
@property(nonatomic, strong) NSString *testStr;
@end

@implementation RecipeViewController

- (void)dealloc
{
    NSLog(@"%s" , __FUNCTION__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"this is root controller");
    
        [[MSRecipeRequestManager sharedInstance] loadRecipeListWithKeyWords:nil Completion:^(MSRequest *request) {
            if (request.isSuccess) {
    
            } else{
                //error alert
            }
        }];
    
//    MSRecipeRequest *recipeRequest = [MSRecipeRequest new];
//    [recipeRequest loadRecipeDetailWithRecipeID:@"1853504" Completion:^(MSRequest *request) {
//        if (request.isSuccess) {
//            self.testStr = request.responseString;
//            NSLog(@"-------: %@", self.testStr);
//        } else{
//            self.testStr = @"122";
//            NSLog(@"dfsdfdasf--: %@",self.testStr);
//            //error alert
////            [[[UIAlertView alloc] initWithTitle:@"" message:@"123"
////                                                           delegate:nil
////                                                   cancelButtonTitle:@"好的" otherButtonTitles: nil] show];
//        }
//    }];
}


@end
