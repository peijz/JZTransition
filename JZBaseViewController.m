//
//  JZBaseViewController.m
//  JZTransition
//
//  Created by wanhongios on 17/1/26.
//  Copyright © 2017年 wanhongios. All rights reserved.
//

#import "JZBaseViewController.h"

@interface JZBaseViewController ()

@end

@implementation JZBaseViewController

-(void)dealloc {
    NSLog(@"%@ dealloc",  NSStringFromClass([self class]));
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
