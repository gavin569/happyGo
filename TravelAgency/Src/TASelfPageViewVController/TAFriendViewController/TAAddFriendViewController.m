//
//  TAAddFriendViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAAddFriendViewController.h"
#import "TAFriendMessageCell.h"
#import "TASearchFriendModel.h"
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
    return self.friendListArr.count;
    
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
               [cell.addButton setTitle:@"添加" forState:UIControlStateNormal];
        }
    TASearchFriendModel*model=_friendListArr[indexPath.row];
    cell.nameLab.text=model.userName;
    cell.phoneLab.text=model.userPhone;
    if ([model.exist isEqualToString:@"0"]) {
        cell.addButton.tag=indexPath.row;
        [cell.addButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.addButton.enabled=YES;
    }else{
   
        cell.addButton.enabled=NO;
        [cell.addButton setTitleColor:COLOR_333333 forState:UIControlStateNormal];
        cell.addButton.alpha=0.4;
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
            [self.friendListArr removeAllObjects];
            [self.friendListArr addObjectsFromArray:messageArr];
            [_friendListTableView reloadData];
        } failure:^{
            
        }];
    }else{
        [TAAlertView showAlertWithTitle:@"温馨提示" message:@"搜素内容不能为空" cancelTitle:@"我知道了"];
    }
}
- (void)addButtonClick:(UIButton*)button{
    TASearchFriendModel*model=_friendListArr[button.tag];
    NSDictionary *userDic=[TACommonTool userInfo];
    NSString *userPhone=[NSString stringWithFormat:@"%@",userDic[@"userPhone"]];
    NSDictionary*parameters=@{@"userPhone":userPhone,
                              @"refrenceUser":model.userPhone,
                              @"roleId":model.roleId};
    NSString*dictStr=[TACommonTool dictionaryToJson:parameters];
    NSDictionary*parameterDict=@{@"friends":dictStr};
    __weak TAAddFriendViewController*weakSelf=self;
    [_viewModel addFriendWithFriendMessageWithDictionary:parameterDict success:^(NSString *isSuccess) {
        if ([isSuccess isEqualToString:@"0"]) {
            model.exist=@"1";
        [weakSelf.friendListArr replaceObjectAtIndex:button.tag withObject:model];
            [weakSelf.friendListTableView reloadData];
        }else{
            [TAAlertView showAlertWithTitle:@"温馨提示" message:@"添加好友失败" cancelTitle:@"我知道了"];
        }
    } failure:^{
        
    }];
    
}
#pragma mark -- GettersAndSetters
- (NSMutableArray*)friendListArr {
    if (!_friendListArr) {
        _friendListArr=[[NSMutableArray alloc]init];
    }
    return _friendListArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
