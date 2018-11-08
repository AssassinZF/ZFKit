//
//  ViewController.m
//  ZFKit
//
//  Created by Daisy on 2017/12/12.
//  Copyright © 2017年 zf. All rights reserved.
//

#import "ViewController.h"
#import "CommonMacro.h"
#import "AppAuthority.h"
#import "UIView+Toast.h"

NSString *const constString = @"constString";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    NSLog(@"hello");
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view makeToast:@"This is toast" position:[NSValue valueWithCGPoint:CGPointMake(100,100)]];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
