//
//  TAMyCarViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/14.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAMyCarViewController.h"
#import "TAAddMyCarViewController.h"
@interface TAMyCarViewController ()

@end

@implementation TAMyCarViewController
#pragma mark -- view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的车";
    [self customNavigationBarRightItemWithImage:[UIImage imageNamed:@"S_6.png"] action:@selector(rightButtonClick)];
}
#pragma  mark -- Event Response
- (void)rightButtonClick {
    TAAddMyCarViewController *addMyCarViewController=[[TAAddMyCarViewController alloc]init];
    [self.navigationController pushViewController:addMyCarViewController animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
