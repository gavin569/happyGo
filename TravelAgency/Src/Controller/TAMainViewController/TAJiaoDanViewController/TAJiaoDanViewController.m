//
//  TAJiaoDanViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/9.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAJiaoDanViewController.h"
#import "TASelfCenterViewController.h"
#import "TAAddressPickerViewController.h"
#import "TAQueryLineMessageViewController.h"

@interface TAJiaoDanViewController ()
{
     NSTimer *_timer;
    UIView *_bomView;
    NSString *_lineNameStr;
}
@end

@implementation TAJiaoDanViewController
#pragma mark -- view life cycle
- (void)viewWillLayoutSubviews {
    
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(154);
        make.centerX.equalTo(self.view);
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
    _viewModel=[[TALineViewModel alloc]init];
    _jiaoDanViewModel=[[TAJiaoDanViewModel alloc]init];
    [self.navigationController.navigationBar setBarTintColor:COLOR_0073be];
    self.view.backgroundColor=COLOR_f1f1f1;
    self.navigationItem.title=@"交单";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:20],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self customNavigationBarLeftItemWithTitle:@"西安" action:@selector(leftItemClick)];
    [self customNavigationBarRightItemWithImage:[UIImage imageNamed:@"smallLogin.png"] action:@selector(rightItemClick)];
    [self.view addSubview:self.topScroView];
    [self.view addSubview:self.pageControl];
    [self.view addSubview:self.topView];
    [self requestLine];
}
#pragma mark -- Event Response
- (void)leftItemClick {
    TAAddressPickerViewController *selectCityViewController=[[TAAddressPickerViewController alloc]init];
    selectCityViewController.AddressBlock = ^(NSString * cityName){
        [self customNavigationBarLeftItemWithTitle:cityName action:@selector(leftItemClick)];
    };
    [self.navigationController pushViewController:selectCityViewController animated:NO];
}
//个人信息
- (void)rightItemClick {
    TASelfCenterViewController*rightVc=[[TASelfCenterViewController alloc]init];
    rightVc.listArr=self.titleArr;
    [self.navigationController pushViewController:rightVc animated:NO];
}
//选择路线
- (void)selectButtonClick {
     __weak TAJiaoDanViewController *weakSelf = self;
    self.pickView.arr=self.lineArray;
    _pickView.block=^(NSString* resultStr){
        if (resultStr==nil) {
            
        }else{
            _lineNameStr=resultStr;
            [weakSelf.selectButton setTitle:resultStr forState:UIControlStateNormal];
        }
        [weakSelf.pickView dismiss];
    };
    [_pickView show];
}
//查询按钮触发的事件
- (void)quaryButtonClick {
 int a=(int)[_lineArray indexOfObject:_lineNameStr];
    NSString*index=[NSString stringWithFormat:@"%@",[_lineIdArr objectAtIndex:a]];
    [_jiaoDanViewModel requestRoutesWithfixedLine:[index intValue] Success:^(NSArray *LineArray) {
        TAQueryLineMessageViewController *lineMessageViewController=[[TAQueryLineMessageViewController alloc]init];
        lineMessageViewController.index=index;
        lineMessageViewController.lineMessageArr=LineArray;
        [self.navigationController pushViewController:lineMessageViewController animated:YES];
    } failure:^{
      [TAAlertView showAlertWithTitle:@"温馨提示" message:@"请选择路线" cancelTitle:@"我知道了"];
    }];

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
- (void)requestLine{
 [_viewModel requestOneDayLineSuccess:^(NSArray *travelArray, NSArray *lineListArray) {
     [self.lineArray addObjectsFromArray:travelArray];
     _lineIdArr=lineListArray;
 } failure:^{

 }];
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
        _topView=[[UIView alloc]initWithFrame:CGRectMake(10, 214, SCREEN_WIDTH-20, 200)];
        _topView.backgroundColor=COLOR_ffffff;
        _topView.layer.cornerRadius=4;
        _topView.clipsToBounds=YES;
        _selectButton=[TASelectButton buttonWithType:UIButtonTypeCustom];
        [_selectButton setTitle:@"请选择路线" forState:UIControlStateNormal];
        [_selectButton addTarget:self action:@selector(selectButtonClick) forControlEvents:UIControlEventTouchUpInside];
        _selectButton.leftImageView.image=[UIImage imageNamed:@"S_6.png"];
        _selectButton.titleLabel.font=SYS_F(14);
        [_selectButton setTitleColor:COLOR_333333 forState:UIControlStateNormal];
        [_topView addSubview:_selectButton];
        [_selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_topView.mas_top).with.offset(40);
            make.left.equalTo(_topView.mas_left).with.offset(50);
            make.right.equalTo(_topView.mas_right).with.offset(-50);
            make.height.equalTo(@40);
        }];
        _quaryButton=[UIButton buttonWithType:UIButtonTypeCustom];
        _quaryButton.titleLabel.font=SYS_F(14);
        [_quaryButton setTitle:@"查询" forState:UIControlStateNormal];
         [_quaryButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _quaryButton.layer.cornerRadius=5;
        _quaryButton.clipsToBounds=YES;
        _quaryButton.layer.borderWidth=1;
        _quaryButton.layer.borderColor=[UIColor blueColor].CGColor;
        [_quaryButton addTarget:self action:@selector(quaryButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_topView addSubview:_quaryButton];
        [_quaryButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_selectButton.mas_bottom).with.offset(20);
            make.left.equalTo(_topView.mas_left).with.offset(50);
            make.right.equalTo(_topView.mas_right).with.offset(-50);
            make.height.equalTo(@30);
        }];
    }
    return _topView;
}

- (TABasePickerView*)pickView {
    if (!_pickView) {
        _pickView = [[TABasePickerView alloc] init];
    }
    return _pickView;
}
- (NSMutableArray*)lineArray {
    if (!_lineArray) {
        _lineArray=[[NSMutableArray alloc]init];
    }
    return _lineArray;
}
- (NSArray*)titleArr {
    if (!_titleArr) {
        _titleArr=[[NSArray alloc]initWithObjects:@"完善资料",@"系统消息",@"我的好友",@"我的账单",@"修改密码",@"退出",nil];
    }
    return _titleArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
