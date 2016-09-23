//
//  TAMyOrderListViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAMyOrderListViewController.h"

@interface TAMyOrderListViewController ()
{
    UIView *_tipView;
    int _index;
}
@end

@implementation TAMyOrderListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的订单";
    [self.view addSubview:self.topView];
    [self.view addSubview:self.orderTableView];
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.orderListArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId=@"cellId";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text=self.orderListArr[indexPath.row];
    return cell;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
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
            NSArray *arr=[[NSArray alloc]initWithObjects:@"1",@"1", @"1", @"1", @"1",  nil];
            [self.orderListArr removeAllObjects];
            [self.orderListArr addObjectsFromArray:arr];
            [_orderTableView reloadData];
        }
            break;
        case 2:
        {
            NSArray *arr=[[NSArray alloc]initWithObjects:@"2",@"2", @"2", @"2", @"2",  nil];
            [_orderListArr removeAllObjects];
            [_orderListArr addObjectsFromArray:arr];
            [_orderTableView reloadData];
        }
            break;
        case 3:
        {
            NSArray *arr=[[NSArray alloc]initWithObjects:@"3",@"3", @"3", @"3", @"3",  nil];
             [_orderListArr removeAllObjects];
            [_orderListArr addObjectsFromArray:arr];
            [_orderTableView reloadData];
        }
            break;
        case 4:
        {
            NSArray *arr=[[NSArray alloc]initWithObjects:@"4",@"4", @"4", @"4", @"4",  nil];
             [_orderListArr removeAllObjects];
            [_orderListArr addObjectsFromArray:arr];
            [_orderTableView reloadData];
        }
            break;
        case 5:
        {
            NSArray *arr=[[NSArray alloc]initWithObjects:@"5",@"5", @"5", @"5", @"5",  nil];
             [_orderListArr removeAllObjects];
            [_orderListArr addObjectsFromArray:arr];
            [_orderTableView reloadData];
        }
            break;
            
        default:
            break;
    }
    
}
#pragma mark -- GettersAndSettings
- (UIView*)topView {
    if (!_topView) {
        _topView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 40)];
        for (int i=0; i<5; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(i*SCREEN_WIDTH/5, 2, SCREEN_WIDTH/5, 34);
            btn.titleLabel.font=SYS_F(12);
            //按钮不动的状态
            [btn setTitle:self.titleArr[i] forState:UIControlStateNormal];
            //没有选中状态下的颜色
            [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            //选中状态下的颜色
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
            btn.tag = i+1;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

            [_topView addSubview:btn];
            //加载按钮上边的三角小图片
            if (i==0) {
                _tipView = [[UIView alloc]init];
                _tipView.center = CGPointMake(btn.center.x, 34);
                _tipView.backgroundColor=[UIColor redColor];

                _tipView.bounds = CGRectMake(0, 0,(SCREEN_WIDTH/5)-5, 1);
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
        _titleArr=[[NSArray alloc]initWithObjects:@"全部",@"未接单",@"已接单",@"未支付",@"已支付", nil];
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
    }
    return _orderTableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
