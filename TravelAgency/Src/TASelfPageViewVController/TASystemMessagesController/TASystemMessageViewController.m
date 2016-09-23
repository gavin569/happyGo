//
//  TASystemMessageViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TASystemMessageViewController.h"

@interface TASystemMessageViewController ()

@end

@implementation TASystemMessageViewController
#pragma mark -- view life cycle
- (void)viewWillAppear:(BOOL)animated {
    [_viewModel requestSystemMessgesSuccess:^(NSArray *messageArr) {
        NSLog(@"----%@",messageArr);
    } failure:^{
        
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"系统消息";
    [self customNavigationBarRightItemWithTitle:@"刷新" action:@selector(rightButtonClick)];
    _viewModel=[[TASelfCenterViewModel alloc]init];
}
#pragma mark -- Event Response
- (void)rightButtonClick {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
