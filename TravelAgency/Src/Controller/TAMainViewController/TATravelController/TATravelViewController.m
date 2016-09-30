//
//  TATravelViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/9.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TATravelViewController.h"
#import "TASelfCenterViewController.h"
#import "TAFirstPageTableViewCell.h"
#import "TALineAndRegisterTableViewCell.h"
#import "TALineListModel.h"
#import "TAAddressPickerViewController.h"
#import "TAQueryLineViewController.h"
#import "TASendGroupViewController.h"
#import "TAAddLineListViewController.h"
@interface TATravelViewController ()
{
    NSTimer *_timer;
    BOOL _isNoShow;
    NSString *_dateStr;
    NSString *_lineStr;
    UIView *_bomView;
    NSString *_lineNameStr;
}
@end

@implementation TATravelViewController
#pragma mark -- view life cycle
- (void)viewWillLayoutSubviews {
    
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(154);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
        
    }];
    [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_leftView);
        make.bottom.equalTo(_leftView.mas_bottom).with.offset(5);
        make.width.equalTo(@100);
        make.height.equalTo(@40);
    }];
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_rightView);
        make.bottom.equalTo(_rightView.mas_bottom).with.offset(5);
        make.width.equalTo(@100);
        make.height.equalTo(@40);
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
    self.navigationItem.title=@"旅行社";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:20],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self customNavigationBarLeftItemWithTitle:@"西安" action:@selector(leftItemClick)];
    [self customNavigationBarRightItemWithImage:[UIImage imageNamed:@"smallLogin.png"] action:@selector(rightItemClick)];
    _viewModel=[[TALineViewModel alloc]init];
    [self.view addSubview:self.topScroView];
    [self.view addSubview:self.pageControl];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.rightView];
    [self.view addSubview:self.leftView];
    [self.leftView addSubview:self.leftButton];
    [self.rightView addSubview:self.rightButton];
    [self.view addSubview:self.showTableView];
    [self requestLine];
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        if (_isNoShow==NO) {
            return self.firstArr.count;
        }else{
            return 0;
        }
    }else{
        return self.secondArr.count;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        static NSString *identifier = @"TALineAndRegisterTableViewCell";
        TALineAndRegisterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            
            cell = [[TALineAndRegisterTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault   reuseIdentifier:identifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        [cell.selectButton setTitle:self.firstArr[indexPath.row] forState:UIControlStateNormal];
        cell.selectButton.leftImageView.image=[UIImage imageNamed:@"S_6.png"];
        cell.selectButton.tag=indexPath.row;
        [cell.selectButton addTarget:self action:@selector(firstPageButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else{
        TAFirstPageTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"TAFirstPageTableViewCell" owner:nil options:nil] firstObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.firstPageButton.layer.cornerRadius=5;
            cell.firstPageButton.clipsToBounds=YES;
            cell.firstPageButton.layer.borderWidth=1;
            cell.firstPageButton.layer.borderColor=[UIColor blueColor].CGColor;
            cell.firstPageButton.tag=indexPath.row+2;
        }
        [cell.firstPageButton addTarget:self action:@selector(firstPageButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        if (_isNoShow==NO) {
             [cell.firstPageButton setTitle:self.secondArr[indexPath.row] forState:UIControlStateNormal];
        }else{
           [cell.firstPageButton setTitle:self.thirdArr[indexPath.row] forState:UIControlStateNormal];
        }

       
        return cell;
    }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.01;
}
#pragma mark -- Event Response
//备留功能，选择城市
- (void)leftItemClick {
    TAAddressPickerViewController *selectCityViewController=[[TAAddressPickerViewController alloc]init];
    selectCityViewController.AddressBlock = ^(NSString * cityName){
        [self customNavigationBarLeftItemWithTitle:cityName action:@selector(leftItemClick)];
    };
    [self.navigationController pushViewController:selectCityViewController animated:NO];
}
- (void)rightItemClick {
    TASelfCenterViewController*rightVc=[[TASelfCenterViewController alloc]init];
    rightVc.listArr=self.selfCenterArr;
    [self.navigationController pushViewController:rightVc animated:NO];
}
- (void)leftButtonClick {
    _isNoShow=NO;
    [_showTableView reloadData];
    _leftButton.backgroundColor=COLOR_ffffff;
    _showTableView.frame=CGRectMake(0, 264, SCREEN_WIDTH, 200);
    [_leftButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _rightButton.backgroundColor=[UIColor blueColor];
    [_rightButton setTitleColor:COLOR_ffffff forState:UIControlStateNormal];
}
- (void)rightButtonClick {
    _isNoShow=YES;
    _showTableView.frame=CGRectMake(0, 264, SCREEN_WIDTH, 100);
    [_showTableView reloadData];
    _rightButton.backgroundColor=COLOR_ffffff;
    [_rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    _leftButton.backgroundColor=[UIColor blueColor];
    [_leftButton setTitleColor:COLOR_ffffff forState:UIControlStateNormal];
}
- (void)firstPageButtonClick:(UIButton*)button {
//    团购
    if (_isNoShow==YES) {
        switch (button.tag) {
                
            case 2:
            {
                TASendGroupViewController *sendGroupViewController=[[TASendGroupViewController alloc]init];
                [self.navigationController pushViewController:sendGroupViewController animated:NO];
            }
                break;
            case 3:
            {
                TAAddLineListViewController * addLineListViewController=[[TAAddLineListViewController alloc]init];
                addLineListViewController.isTGLine=YES;
                [self.navigationController pushViewController:addLineListViewController animated:NO];
            }
                break;
                
            default:
                break;
        }
    }else{
//    一日游
          __weak TATravelViewController *weakSelf = self;
        switch (button.tag) {
            case 0:
            {
                self.datePickViewA.block=^(NSString* dateStr){
                    if (dateStr==nil) {
                        
                    }else{
                        _dateStr=dateStr;
                        [weakSelf.firstArr replaceObjectAtIndex:0 withObject:dateStr];
                        [weakSelf.showTableView reloadData];
                    }
                    [weakSelf.datePickViewA dismiss];
                    
                };
                [_datePickViewA show];
            }
                break;
            case 1:
            {
                self.pickView.arr=self.lineList;
                _pickView.block=^(NSString* resultStr){
                    if (resultStr==nil) {
                    }else{
                        _lineStr=resultStr;
                        [weakSelf.firstArr replaceObjectAtIndex:1 withObject:resultStr];
                        [weakSelf.showTableView reloadData];
                    }
                     [weakSelf.pickView dismiss];
                    
                };
                [_pickView show];
            }
                break;
            case 2:
            {
//                if (!_lineNameStr) {
//                    [TAAlertView showAlertWithTitle:@"温馨提示" message:@"请先选择路线" cancelTitle:@"我知道了"];
//                }else{
//                    
//                }
                TAQueryLineViewController *queryController=[[TAQueryLineViewController alloc]init];
                [self.navigationController pushViewController:queryController animated:NO];
            }
                break;
            case 3:
            {
                TAAddLineListViewController * addLineListViewController=[[TAAddLineListViewController alloc]init];
                addLineListViewController.isTGLine=NO;
                [self.navigationController pushViewController:addLineListViewController animated:NO];
            }
                break;
                
            default:
                break;
        }
    }
    
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
        [self.lineList addObjectsFromArray:travelArray];
        [self.lineIdArr addObjectsFromArray:lineListArray];

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
- (UITableView*)showTableView {
    if (!_showTableView) {
        _showTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 264, SCREEN_WIDTH, 200) style:UITableViewStyleGrouped];
        _showTableView.backgroundColor = COLOR_ffffff;
        _showTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _showTableView.scrollEnabled=NO;
        _showTableView.delegate=self;
        _showTableView.dataSource=self;
        _showTableView.rowHeight=50;
        _showTableView.showsHorizontalScrollIndicator=NO;
        _showTableView.showsVerticalScrollIndicator=NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return _showTableView;
}
- (NSArray*)firstArr {
    if (!_firstArr) {
        NSDate *currentDate = [NSDate date];//获取当前时间，日期
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY－MM－dd"];
        NSString *dateString = [dateFormatter stringFromDate:currentDate];
        _firstArr=[[NSMutableArray alloc]initWithObjects:dateString,@"请选择路线",nil];
    }
    
    return _firstArr;
}
- (NSArray*)secondArr {
    if (!_secondArr) {
        _secondArr=[[NSMutableArray alloc]initWithObjects:@"查询路线",@"添加路线",nil];
    }
    
    return _secondArr;
}
- (NSArray*)thirdArr {
    if (!_thirdArr) {
        _thirdArr=[[NSMutableArray alloc]initWithObjects:@"发团",@"添加路线",nil];
    }
    
    return _thirdArr;
}
- (NSArray*)selfCenterArr {
    if (!_selfCenterArr) {
        _selfCenterArr=[[NSArray alloc]initWithObjects:@"完善资料",@"系统消息", @"我的好友",@"我的路线",@"我的账单",@"我的订单",@"修改密码",@"退出",nil];
    }
    return _selfCenterArr;
}
- (UIView*)topView {
    if (!_topView) {
        _topView=[[UIView alloc]initWithFrame:CGRectMake(0, 194, SCREEN_WIDTH, 20)];
        _topView.backgroundColor=COLOR_f1f1f1;
    }
    return _topView;
}
- (UIView*)leftView {
    if (!_leftView) {
        _leftView=[[UIView alloc]initWithFrame:CGRectMake(0, 214, SCREEN_WIDTH/2, 50)];
        _leftView.backgroundColor=[UIColor blueColor];
    }
    return _leftView;
}
- (UIView*)rightView {
    if (!_rightView) {
        _rightView=[[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, 214, SCREEN_WIDTH/2, 50)];
        _rightView.backgroundColor=[UIColor blueColor];
    }
    return _rightView;
}
- (UIButton*)leftButton {
    if (!_leftButton) {
        _leftButton=[[UIButton alloc]init];
        [_leftButton setTitle:@"一日游" forState:UIControlStateNormal];
        _leftButton.backgroundColor=COLOR_ffffff;
        [_leftButton setTitleColor:[UIColor blueColor]forState:UIControlStateNormal];
        _leftButton.layer.cornerRadius=5;
        [_leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
        _leftButton.clipsToBounds=YES;
    }
    return _leftButton;
}
- (UIButton*)rightButton {
    if (!_rightButton) {
        _rightButton=[[UIButton alloc]init];
        [_rightButton setTitle:@"团购游" forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
        _rightButton.backgroundColor=[UIColor blueColor];
        [_rightButton setTitleColor:COLOR_ffffff forState:UIControlStateNormal];
        _rightButton.layer.cornerRadius=5;
        _rightButton.clipsToBounds=YES;
    }
    return _rightButton;
}
- (WJDatePickerView*)datePickViewA {
    if (!_datePickViewA) {
        _datePickViewA = [[WJDatePickerView alloc]init];
    }
    return _datePickViewA;
}
- (TABasePickerView*)pickView {
    if (!_pickView) {
        _pickView = [[TABasePickerView alloc]init];
    }
    return _pickView;
}
- (NSMutableArray*)lineList {
    if (!_lineList) {
        _lineList=[[NSMutableArray alloc]init];
    }
    return _lineList;
}
- (NSMutableArray*)teamLineList {
    if (!_teamLineList) {
        _teamLineList=[[NSMutableArray alloc]init];
    }
    return _teamLineList;
}
- (NSMutableArray*)lineIdArr {
    if (!_lineIdArr) {
        _lineIdArr=[[NSMutableArray alloc]init];
    }
    return _lineIdArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
