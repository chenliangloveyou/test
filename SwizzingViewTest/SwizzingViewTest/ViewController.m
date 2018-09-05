//
//  ViewController.m
//  SwizzingViewTest
//
//  Created by bjhl on 2018/9/5.
//  Copyright © 2018年 bjhl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UITextField *textF = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    textF.backgroundColor = [UIColor redColor];
    [self.view addSubview:textF];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [textF becomeFirstResponder];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
