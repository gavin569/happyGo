//
//  TAFriendViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAFriendViewController.h"
#import "TAAddFriendViewController.h"
@interface TAFriendViewController ()

@end

@implementation TAFriendViewController
#pragma mark -- view life cycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_viewModel requestMyFriendsListSuccess:^(NSArray *messageArr) {
        NSLog(@"----%@",messageArr);
    } failure:^{
        
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的好友";
    _viewModel=[[TASelfCenterViewModel alloc]init];
    [self customNavigationBarRightItemWithImage:[UIImage imageNamed:@"S_6.png"] action:@selector(rightButonClick)];
}
#pragma mark -- Event Response
- (void)rightButonClick {
    TAAddFriendViewController *addFriendVC=[[TAAddFriendViewController alloc]init];
    [self.navigationController pushViewController:addFriendVC animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
