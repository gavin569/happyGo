//
//  TAMyOrderListViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAMyOrderListViewController.h"
#import "TAMyOrderTableViewCell.h"
#import "TATravelOrderDetailViewController.h"
#import "TAOrderBigModel.h"
@interface TAMyOrderListViewController ()
{
    UIView *_tipView;
    int _index;
    int _orderStatus;
}
@end

@implementation TAMyOrderListViewController
#pragma mark -- view life cycle
- (void)viewWillAppear:(BOOL)animated {
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的订单";
    [self.view addSubview:self.topView];
    [self.view addSubview:self.orderTableView];
    [self createViewModel];
    _orderStatus=0;
    [self refresh];

}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _viewModel.orderListArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TAMyOrderTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"TAMyOrderTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TAMyOrderTableViewCell" owner:nil options:nil] firstObject];
    }
    TAOrderBigModel*model=_viewModel.orderListArr[indexPath.row];
    cell.phoneLab.text=[NSString stringWithFormat:@"%@",model.toursimPhone];
    cell.nunberPeopleLab.text=model.tourismNum;
    return cell;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TATravelOrderDetailViewController *detailVc=[[TATravelOrderDetailViewController alloc]init];
    detailVc.model=_viewModel.orderListArr[indexPath.row];
    [self.navigationController pushViewController:detailVc animated:NO];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.01;
}

#pragma mark -- Event Response
- (void)btnClick:(UIButton*)button {
    //通过设置的全局变量index，找上一次点击的按钮
    UIButton *lastBtn = (UIButton *)[self.view viewWithTag:_index];
    lastBtn.selected = NO;
    button.selected = YES;
    _tipView.center = CGPointMake(button.center.x, 34);
    //每点击一次修改一次index记录
    _index = (int)button.tag;
    [self changeOrderList];
}
#pragma mark -- Private Method
- (void)changeOrderList {
    switch (_index) {
        case 1:
        {
            _orderStatus=0;
            [self refresh];
        }
            break;
        case 2:
        {
            _orderStatus=1;
            [self refresh];
        }
            break;
        case 3:
        {
            _orderStatus=2;
             [self refresh];
        }
            break;
        default:
            break;
    }
    
}
- (void)createViewModel
{
    _viewModel=[[TASelfCenterViewModel alloc]init];
    
    __block UITableView *bTableView = _orderTableView;
    
    _viewModel.refreshCompletion = ^(BOOL noMore) {
        [bTableView reloadData];
        [bTableView.mj_header endRefreshing];
        [bTableView.mj_footer endRefreshing];
        
        if (noMore)
        {
            [bTableView.mj_footer setHidden:YES];
        }
        else {
            [bTableView.mj_footer setHidden:NO];
            
        }
        
    };
    
    _viewModel.activeFailure = ^ {
        [bTableView.mj_header endRefreshing];
        [bTableView.mj_footer endRefreshing];
    };
}
- (void)refresh{
     [_viewModel refreshTravelOrderListWithStatus:_orderStatus];
}
- (void)loadMore{
     [_viewModel loadMoreTravelOrderListWithStatus:_orderStatus];
}

#pragma mark -- GettersAndSettings
- (UIView*)topView {
    if (!_topView) {
        _topView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 40)];
        for (int i=0; i<3; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(i*SCREEN_WIDTH/3, 2, SCREEN_WIDTH/3, 34);
            btn.titleLabel.font=SYS_F(12);
            [btn setTitle:self.titleArr[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
            btn.tag = i+1;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

            [_topView addSubview:btn];
            if (i==0) {
                _tipView = [[UIView alloc]init];
                _tipView.center = CGPointMake(btn.center.x, 34);
                _tipView.backgroundColor=[UIColor redColor];

                _tipView.bounds = CGRectMake(0, 0,(SCREEN_WIDTH/3)-5, 1);
                [_topView addSubview:_tipView];
                //默认第一个按钮选中
                btn.selected = YES;
                _index =(int)btn.tag;
            }
            [self changeOrderList];
        
    }
    }
    return _topView;
}
- (NSArray*)titleArr {
    if (!_titleArr) {
        _titleArr=[[NSArray alloc]initWithObjects:@"全部",@"未接单",@"已接单", nil];
    }
    return _titleArr;
}
- (NSMutableArray*)orderListArr {
    if (!_orderListArr) {
        _orderListArr=[[NSMutableArray alloc]init];
    }
    return _orderListArr;
}
- (UITableView*)orderTableView {
    if (!_orderTableView) {
        _orderTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 105, SCREEN_WIDTH, SCREEN_HEIGHT-105) style:UITableViewStyleGrouped];
        _orderTableView.rowHeight=44;
        _orderTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _orderTableView.delegate=self;
        _orderTableView.dataSource=self;
        _orderTableView.showsVerticalScrollIndicator=NO;
        _orderTableView.showsHorizontalScrollIndicator=NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
        _orderTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
        _orderTableView.mj_footer = [MJRefreshAutoStateFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
        _orderTableView.mj_footer.automaticallyHidden = NO;
        _orderTableView.mj_footer.hidden = YES;
        
    }
    return _orderTableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
