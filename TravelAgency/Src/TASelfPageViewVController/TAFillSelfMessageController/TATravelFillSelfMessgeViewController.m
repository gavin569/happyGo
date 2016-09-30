//
//  TATravelFillSelfMessgeViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/29.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TATravelFillSelfMessgeViewController.h"

@interface TATravelFillSelfMessgeViewController ()

@end

@implementation TATravelFillSelfMessgeViewController
#pragma mark -- view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"完善资料";
    [self customNavigationBarRightItemWithTitle:@"提交" action:@selector(submitButtonClick)];
    self.view.backgroundColor=COLOR_f1f1f1;
    [self setupUI];
}
#pragma mark -- setup UI
- (void)setupUI {
    _updateButton.backgroundColor=[UIColor blueColor];
    _updateButton.titleLabel.font=SYS_F(12);
    [_updateButton setTitle:@"上传" forState:UIControlStateNormal];
    _updateButton.layer.cornerRadius=4.0f;
    _updateButton.clipsToBounds=YES;
    [_updateButton setTitleColor:COLOR_ffffff forState:UIControlStateNormal];
    [_updateButton addTarget:self action:@selector(updateButtonClick) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark -- Event Response
//提交个人资料
- (void)submitButtonClick {
    
}
//上传按钮触发的事件
- (void)updateButtonClick {
    [self.view addSubview:self.bomView];
}
//上传图片
- (void)leftButtonClick{
    
}
//上传照片
- (void)centerButtonClick{
    
}
//取消
- (void)rightButtonClick{
    [_bomView removeFromSuperview];
}

#pragma mark -- GettersAndSetters
- (UIView*)bomView{
    if (!_bomView) {
        _bomView=[[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-80,SCREEN_WIDTH, 80)];
        
        UIButton *leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.backgroundColor=[UIColor redColor];
        [leftButton setImage:[UIImage imageNamed:@"S_6.png"] forState:UIControlStateNormal];
        leftButton.frame=CGRectMake(0, 0, SCREEN_WIDTH/3, 80);
        [leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_bomView addSubview:leftButton];
        
        UIButton *centerButton=[UIButton buttonWithType:UIButtonTypeCustom];
        centerButton.backgroundColor=[UIColor yellowColor];
        centerButton.frame=CGRectMake(SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3, 80);
        [centerButton setImage:[UIImage imageNamed:@"S_6.png"] forState:UIControlStateNormal];
        [centerButton addTarget:self action:@selector(centerButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_bomView addSubview:centerButton];
        
        UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.backgroundColor=[UIColor redColor];
        rightButton.frame=CGRectMake(2*SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3, 80);
        [rightButton setImage:[UIImage imageNamed:@"S_6.png"] forState:UIControlStateNormal];
        [rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_bomView addSubview:rightButton];
    }
    return _bomView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
