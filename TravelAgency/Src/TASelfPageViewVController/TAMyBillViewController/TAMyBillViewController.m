//
//  TAMyBillViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/28.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAMyBillViewController.h"
#import "TATBillTableViewCell.h"
#import "TABillListModel.h"
@interface TAMyBillViewController ()

@end

@implementation TAMyBillViewController

#pragma mark -- view life cycle
- (void)viewWillAppear:(BOOL)animated {
    [_viewModel requestMyBillListSuccess:^(NSArray *messageArr) {
        [self.billListArr addObjectsFromArray:messageArr];
        [_billTableView reloadData];
    } failure:^{
        
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的账单";
    _viewModel=[[TASelfCenterViewModel alloc]init];
    [self setupUI];
}
#pragma mark -- setup UI
- (void)setupUI {
    _billTableView.rowHeight=44;
    _billTableView.delegate=self;
    _billTableView.dataSource=self;
    
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.billListArr.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TATBillTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"TATBillTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TATBillTableViewCell" owner:nil options:nil] firstObject];
    }
    TABillListModel *model=self.billListArr[indexPath.row];
    cell.dateLab.text=model.orderDate;
    cell.sourceLab.text=model.showPayName;
    cell.moneyLab.text=model.payMoney;
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
#pragma mark -- GettersAndSetters
- (NSMutableArray*)billListArr {
    if (!_billListArr) {
        _billListArr=[[NSMutableArray alloc]init];
    }
    return _billListArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
