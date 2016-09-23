//
//  TALineListViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TALineListViewController.h"
#import "TAAddLineListViewController.h"
@interface TALineListViewController ()

@end

@implementation TALineListViewController
#pragma mark -- view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的路线";
    [self customNavigationBarRightItemWithImage:[UIImage imageNamed:@"S_6.png"] action:@selector(rightButonClick)];
}
#pragma mark -- Event Response
- (void)rightButonClick {
    TAAddLineListViewController *addLineVC=[[TAAddLineListViewController alloc]init];
    [self.navigationController pushViewController:addLineVC animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
