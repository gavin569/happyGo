//
//  TALineListViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TALineListViewController.h"
#import "TAAddLineListViewController.h"
#import "TALineListTableViewCell.h"
#import "TATravelLineModel.h"
@interface TALineListViewController ()

@end

@implementation TALineListViewController
#pragma mark -- view life cycle
- (void)viewWillAppear:(BOOL)animated {
    [_viewModel requestMyLineListSuccess:^(NSArray *messageArr) {
        [self.lineListArr removeAllObjects];
        [self.lineListArr addObjectsFromArray:messageArr];
        [_lineListTableView reloadData];
    } failure:^{
        
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的路线";
    [self customNavigationBarRightItemWithImage:[UIImage imageNamed:@"S_6.png"] action:@selector(rightButonClick)];
    [self.view addSubview:self.lineListTableView];
    _viewModel=[[TASelfCenterViewModel alloc]init];
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lineListArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TALineListTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"TALineListTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TALineListTableViewCell" owner:nil options:nil] firstObject];
        cell.bgView.layer.cornerRadius=5.0f;
        cell.bgView.clipsToBounds=YES;
           cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    TATravelLineModel *model=self.lineListArr[indexPath.row];
    cell.lineNameLab.text=model.userName;
    cell.lineContentLab.text=model.routesContent;
    cell.allTicketLab.text=[NSString stringWithFormat:@"%@",model.price1];
    cell.halfTicketLab.text=[NSString stringWithFormat:@"%@",model.price2];
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
- (void)rightButonClick {
    TAAddLineListViewController *addLineVC=[[TAAddLineListViewController alloc]init];
    [self.navigationController pushViewController:addLineVC animated:NO];
}
#pragma mark -- GettersAndSetters
- (UITableView*)lineListTableView {
    if (!_lineListTableView) {
        _lineListTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _lineListTableView.backgroundColor = COLOR_ffffff;
        _lineListTableView.rowHeight=150;
        _lineListTableView.delegate=self;
        _lineListTableView.dataSource=self;
        _lineListTableView.showsHorizontalScrollIndicator=NO;
        _lineListTableView.showsVerticalScrollIndicator=NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return _lineListTableView;
}
- (NSMutableArray*)lineListArr {
    if (!_lineListArr) {
        _lineListArr=[[NSMutableArray alloc]init];
    }
    return _lineListArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
