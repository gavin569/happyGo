//
//  TACheckViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/20.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TACheckViewController.h"
#import "TAFriendMessageCell.h"
@interface TACheckViewController ()

@end

@implementation TACheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];

}
#pragma mark -- setup UI
- (void)setupUI{
    _dateLab.text=_dateStr;
    _messageLab.text=_messageStr;
    _topView.layer.cornerRadius=5.0f;
    _topView.clipsToBounds=YES;
    _driverSystemButton.layer.cornerRadius=5.0f;
    _driverSystemButton.clipsToBounds=YES;
    _driverSystemButton.layer.borderWidth=1.0f;
    _driverSystemButton.layer.borderColor=[UIColor blueColor].CGColor;
    [_driverSystemButton addTarget:self action:@selector(driverButtonSystemClick) forControlEvents:UIControlEventTouchUpInside];
    
    _touristSystemButton.layer.cornerRadius=5.0f;
    _touristSystemButton.clipsToBounds=YES;
    _touristSystemButton.layer.borderWidth=1.0f;
    _touristSystemButton.layer.borderColor=[UIColor blueColor].CGColor;
    [_touristSystemButton addTarget:self action:@selector(touristSystemButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    _leftTableView.delegate=self;
    _leftTableView.dataSource=self;
    _leftTableView.rowHeight=80;
    
    _rightTableView.delegate=self;
    _rightTableView.dataSource=self;
    _rightTableView.rowHeight=80;
    
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TAFriendMessageCell*cell = [tableView dequeueReusableCellWithIdentifier:@"TAFriendMessageCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TAFriendMessageCell" owner:nil options:nil] firstObject];
        cell.addButton.layer.cornerRadius=5;
        cell.addButton.clipsToBounds=YES;
        cell.addButton.layer.borderColor=[UIColor blueColor].CGColor;
        cell.addButton.layer.borderWidth=1.0f;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
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
//司机系统触发的事件
- (void)driverButtonSystemClick {
    
}
//导游系统触发的事件
- (void)touristSystemButtonClick {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
