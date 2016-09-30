//
//  TAAddLineListViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAAddLineListViewController.h"
#import "TATravelSceneViewController.h"
@interface TAAddLineListViewController ()

@end

@implementation TAAddLineListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"添加路线";
    [self customNavigationBarRightItemWithTitle:@"提交" action:@selector(rightButtonClick)];
}
#pragma mark -- Event Response
- (IBAction)contentViewedClick:(id)sender {
     [self.view endEditing:YES];
    TATravelSceneViewController *sceneViewController=[[TATravelSceneViewController alloc]init];
    sceneViewController.sceneBlock=^(NSString*sceneString){
        _lineContentLab.text=sceneString;
        NSLog(@"---%@",sceneString);
    };
    [self.navigationController pushViewController:sceneViewController animated:NO];
}
//提交按钮触发的事件
- (void)rightButtonClick {
    [self.view endEditing:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
