//
//  ViewController.m
//  MSRequestDemo
//
//  Created by meishi on 28/08/2017.
//  Copyright © 2017 Kangbo. All rights reserved.
//

#import "ViewController.h"
#import "MSRecipeRequestManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"this is root controller");
    
    [[MSRecipeRequestManager sharedInstance] loadRecipeListWithKeyWords:@"" Completion:^(MSRequest *request) {
        if (request.isSuccess) {
            
        } else{
            //error alert
        }
    }];
    
    MSRecipeRequest *recipeRequest = [MSRecipeRequest new];
    [recipeRequest loadRecipeDetailWithRecipeID:@"" Completion:^(MSRequest *request) {
        if (request.isSuccess) {
            
        } else{
            //error alert
        }
    }];
    
}

@end
