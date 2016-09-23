//
//  TACarPriceViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/14.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TACarPriceViewController.h"
#import "TAAddCarPriceViewController.h"
@interface TACarPriceViewController ()

@end

@implementation TACarPriceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"车辆报价";
    [self customNavigationBarRightItemWithImage:[UIImage imageNamed:@"S_6.png"] action:@selector(rightButtonClick)];
}
#pragma mark -- Event Response
- (void)rightButtonClick {
    TAAddCarPriceViewController *addCarPriceViewController=[[TAAddCarPriceViewController alloc]init];
    [self.navigationController pushViewController:addCarPriceViewController animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
