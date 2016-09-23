//
//  TAALLRouteViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/14.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAALLRouteViewController.h"
#import "TAOwnerLineTableViewCell.h"
#import "TALineInOwnerModel.h"

@interface TAALLRouteViewController ()

@end

@implementation TAALLRouteViewController
#pragma mark -- view life cycle
- (void)viewWillAppear:(BOOL)animated {
    [_viewModel requestAllRoutesInOwnerSuccess:^(NSArray *travelArray, NSArray *lineListArray) {
        [self.lineArr addObjectsFromArray:lineListArray];
        [self.travelArr addObjectsFromArray:travelArray];

        [_TAAllRoutesTableView reloadData];
        
    } failure:^{
        
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel=[[TALineViewModel alloc]init];
    self.navigationItem.title=@"线路";
    [self customNavigationBarRightItemWithTitle:@"刷新" action:@selector(rightButtonClick)];
    [self.view addSubview:self.TAAllRoutesTableView];
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr=self.lineArr[section];
    return arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TAOwnerLineTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"TAOwnerLineTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TAOwnerLineTableViewCell" owner:nil options:nil] firstObject];
    }
            NSArray*arr=self.lineArr[indexPath.section];
            TALineInOwnerModel*model=arr[indexPath.row];
    cell.LineNameLab.text=model.routesName;
    cell.LineDescribeLab.text=model.routesContent;
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.travelArr.count;
}
#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 40;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    self.headerView.leftLab.text=self.travelArr[section];
    return _headerView;
}
#pragma mark -- Event Response
//刷新按钮触发的事件
- (void)rightButtonClick {
    
}
#pragma mark -- GettersAndSetters
- (UITableView*)TAAllRoutesTableView {
    if (!_TAAllRoutesTableView) {
        _TAAllRoutesTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _TAAllRoutesTableView.backgroundColor = COLOR_ffffff;
        _TAAllRoutesTableView.delegate=self;
        _TAAllRoutesTableView.dataSource=self;
        _TAAllRoutesTableView.rowHeight=80;
        _TAAllRoutesTableView.showsHorizontalScrollIndicator=NO;
        _TAAllRoutesTableView.showsVerticalScrollIndicator=NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return _TAAllRoutesTableView;
}
- (NSMutableArray*)lineArr {
    if (!_lineArr) {
        _lineArr=[[NSMutableArray alloc]init];
    }
    return _lineArr;
}
- (NSMutableArray*)travelArr {
    if (!_travelArr) {
        _travelArr=[[NSMutableArray alloc]init];
    }
    return _travelArr;
}
- (TAOwnerHeaderView*)headerView {
    if (!_headerView) {
        _headerView=[[TAOwnerHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    }
    return _headerView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
