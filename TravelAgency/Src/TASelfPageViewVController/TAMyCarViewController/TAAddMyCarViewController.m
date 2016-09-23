//
//  TAAddMyCarViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/14.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAAddMyCarViewController.h"

@interface TAAddMyCarViewController ()

@end

@implementation TAAddMyCarViewController
#pragma mark -- view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"绑定我的车";
    [self customNavigationBarRightItemWithTitle:@"提交" action:@selector(rightButtonClick)];
}
#pragma mark -- Event Response
- (void)rightButtonClick {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
