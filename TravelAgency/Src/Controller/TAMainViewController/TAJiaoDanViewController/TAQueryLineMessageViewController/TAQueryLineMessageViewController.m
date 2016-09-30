//
//  TAQueryLineMessageViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/26.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAQueryLineMessageViewController.h"
#import "TAQueryLineMessageTableViewCell.h"
#import "TAJiaoDanModel.h"
#import "TADetailLineMessageViewController.h"
@interface TAQueryLineMessageViewController ()

@end

@implementation TAQueryLineMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.lineMessageTableView];
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _lineMessageArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TAQueryLineMessageTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"TAQueryLineMessageTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TAQueryLineMessageTableViewCell" owner:nil options:nil] firstObject];
    }
    TAJiaoDanModel*model=_lineMessageArr[indexPath.row];
    cell.phoneNumberLab.text=model.userName;
    cell.allTicketLab.text=[NSString stringWithFormat:@"全票：%@元",model.price1];
    cell.halfTicketLab.text=[NSString stringWithFormat:@"半票：%@元",model.price2];;
    cell.contactLab.text=model.routesContent;
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TADetailLineMessageViewController *detailVc=[[TADetailLineMessageViewController alloc]init];
    detailVc.lineIdStr=_index;
    detailVc.model=_lineMessageArr[indexPath.row];
    [self.navigationController pushViewController:detailVc animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.01;
}
#pragma mark -- GettersAndSettters
- (UITableView*)lineMessageTableView {
    if (!_lineMessageTableView) {
        _lineMessageTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _lineMessageTableView.backgroundColor = COLOR_ffffff;
        _lineMessageTableView.delegate=self;
        _lineMessageTableView.dataSource=self;
        _lineMessageTableView.rowHeight=100;
        _lineMessageTableView.showsHorizontalScrollIndicator=NO;
        _lineMessageTableView.showsVerticalScrollIndicator=NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return _lineMessageTableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
