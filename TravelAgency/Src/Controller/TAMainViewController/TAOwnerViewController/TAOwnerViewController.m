//
//  TAOwnerViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/9.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAOwnerViewController.h"
#import "TASelfCenterViewController.h"
#import "TACarPriceViewController.h"
#import "TAAddressPickerViewController.h"
@interface TAOwnerViewController ()
{
    NSTimer *_timer;
}
@end

@implementation TAOwnerViewController

#pragma mark -- view life cycle
- (void)viewWillLayoutSubviews {
    
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(154);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    [_bomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-10);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(startRun) userInfo:nil     repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    _pageControl.currentPage=0;
    
}
- (void)viewDidDisappear:(BOOL)animated {
    [_timer invalidate];
    _timer = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBarTintColor:COLOR_0073be];
    self.view.backgroundColor=COLOR_f1f1f1;
    self.navigationItem.title=@"车主";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:20],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self customNavigationBarLeftItemWithTitle:@"西安" action:@selector(leftItemClick)];
    [self customNavigationBarRightItemWithImage:[UIImage imageNamed:@"smallLogin.png"] action:@selector(rightItemClick)];
    [self.view addSubview:self.topScroView];
    [self.view addSubview:self.pageControl];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.bomButton];

}
#pragma mark -- Event Response
- (void)leftItemClick {
    TAAddressPickerViewController *selectCityViewController=[[TAAddressPickerViewController alloc]init];
    selectCityViewController.AddressBlock = ^(NSString * cityName){
        [self customNavigationBarLeftItemWithTitle:cityName action:@selector(leftItemClick)];
    };
    [self.navigationController pushViewController:selectCityViewController animated:NO];}
- (void)rightItemClick {
    TASelfCenterViewController*rightVc=[[TASelfCenterViewController alloc]init];
    rightVc.listArr=self.titleArr;
    [self.navigationController pushViewController:rightVc animated:NO];
}
//点击日程触发的事件
- (void)programmeButtonClick {
    
}
//点击车辆报价触发的事件
- (void)bomButtonClick {
    TACarPriceViewController *carPriceViewController=[[TACarPriceViewController alloc]init];
    [self.navigationController pushViewController:carPriceViewController animated:NO];
}
#pragma mark -- Private Method
- (void)startRun {
    static int count = 1;
    [UIView animateWithDuration:2 animations:^{
        _pageControl.currentPage += count;
        _topScroView.contentOffset = CGPointMake(_pageControl.currentPage*SCREEN_WIDTH, 0);
    }];
    
    if (_pageControl.currentPage==3 || _pageControl.currentPage==0) {
        count = -count;
    }
}
#pragma mark -- GettersAndSetters
- (UIView*)topScroView{
    if (!_topScroView) {
        _topScroView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 130)];
        _topScroView.showsVerticalScrollIndicator=NO;
        _topScroView.showsHorizontalScrollIndicator=NO;
        _topScroView.pagingEnabled = YES;
        _topScroView.contentSize = CGSizeMake(SCREEN_WIDTH*4, 130);
        self.automaticallyAdjustsScrollViewInsets=NO;
        for (int i=0; i<4; i++) {
            UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(i*SCREEN_WIDTH, 0,SCREEN_WIDTH, 130)];
            imgView.image=[UIImage imageNamed:@"banner.png"];
            
            [_topScroView addSubview:imgView];
        }
    }
    return _topScroView;
}
- (UIPageControl*)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.numberOfPages = 4;
        _pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
        _pageControl.pageIndicatorTintColor = [UIColor orangeColor];
        
    }
    return _pageControl;
}

- (UIView*)topView {
    if (!_topView) {
        _topView=[[UIView alloc]initWithFrame:CGRectMake(0, 194, SCREEN_WIDTH, 40)];
        _topView.backgroundColor=[UIColor greenColor];
        UIButton *programmeButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [programmeButton setImage:[UIImage imageNamed:@"S_6.png"] forState:UIControlStateNormal];
        [programmeButton setTitle:@"日程" forState:UIControlStateNormal];
        [programmeButton addTarget:self action:@selector(programmeButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [programmeButton setTitleColor:COLOR_333333 forState:UIControlStateNormal];
        programmeButton.imageEdgeInsets = UIEdgeInsetsMake(0, -7.5, 0, 0);
        programmeButton.titleEdgeInsets = UIEdgeInsetsMake(0, 7.5, 0, 0);
        [_topView addSubview:programmeButton];
        [programmeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_topView);
            make.left.equalTo(_topView.mas_left).with.offset(11);
            make.width.equalTo(@80);
            make.height.equalTo(@35);
        }];
    }
    return _topView;
}
- (NSArray*)titleArr {
    if (!_titleArr) {
        _titleArr=[[NSArray alloc]initWithObjects:@"完善资料",@"系统消息",@"我的好友",@"我的账单",@"我的车",@"修改密码",@"退出",nil];
    }
    return _titleArr;
}
- (UIButton*)bomButton {
    if (!_bomButton) {
        _bomButton=[UIButton buttonWithType:UIButtonTypeCustom];
        _bomButton.layer.cornerRadius=4.0f;
        _bomButton.clipsToBounds=YES;
        _bomButton.layer.borderColor=[UIColor blueColor].CGColor;
        _bomButton.layer.borderWidth=1.0f;
        [_bomButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_bomButton setTitle:@"车辆报价" forState:UIControlStateNormal];
        _bomButton.titleLabel.font=SYS_F(12);
        [_bomButton addTarget:self action:@selector(bomButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bomButton;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
