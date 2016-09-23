//
//  TAAddFriendViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAAddFriendViewController.h"
#import "TAFriendMessageCell.h"
@interface TAAddFriendViewController ()

@end

@implementation TAAddFriendViewController
#pragma mark -- view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"添加好友";
    _viewModel=[[TASelfCenterViewModel alloc]init];
    [self setupUI];
}
#pragma mark --Setup UI
- (void)setupUI {
    _searchTextFieldView.layer.borderWidth=1.0f;
    _searchTextFieldView.layer.borderColor=COLOR_d1d1d1.CGColor;
    _searchTextFieldView.layer.cornerRadius=15;
    _searchTextFieldView.clipsToBounds=YES;
    _friendListTableView.rowHeight=80;
    _friendListTableView.delegate=self;
    _friendListTableView.dataSource=self;
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
//搜索按钮触发的事件
- (IBAction)searchButtonClick:(id)sender {
    if (_searchTextField.text.length>0) {
        [_viewModel searchFirendWithFriendsMessges:_searchTextField.text success:^(NSArray *messageArr) {
            
        } failure:^{
            
        }];
    }else{
        [TAAlertView showAlertWithTitle:@"温馨提示" message:@"搜素内容不能为空" cancelTitle:@"我知道了"];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
