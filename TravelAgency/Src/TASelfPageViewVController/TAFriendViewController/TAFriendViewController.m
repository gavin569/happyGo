//
//  TAFriendViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAFriendViewController.h"
#import "TAAddFriendViewController.h"
#import "TAFriendListTableViewCell.h"
#import "TAFriendModel.h"
@interface TAFriendViewController ()

@end

@implementation TAFriendViewController
#pragma mark -- view life cycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_viewModel requestMyFriendsListSuccess:^(NSArray *sectionArr, NSArray *rowArr) {
        [self.rowArr removeAllObjects];
        [self.sectionArr removeAllObjects];
        [self.rowArr addObjectsFromArray:rowArr];
        [self.sectionArr addObjectsFromArray:sectionArr];
        [_firendsListTableView reloadData];
    } failure:^{
        
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的好友";
    _viewModel=[[TASelfCenterViewModel alloc]init];
    [self customNavigationBarRightItemWithImage:[UIImage imageNamed:@"S_6.png"] action:@selector(rightButonClick)];
    [self.view addSubview:self.firendsListTableView];
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.rowArr[section]count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TAFriendListTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"TAFriendListTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TAFriendListTableViewCell" owner:nil options:nil] firstObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    TAFriendModel*model=self.rowArr[indexPath.section][indexPath.row];
    cell.nameLab.text=model.friendName;
    cell.phoneLab.text=[NSString stringWithFormat:@"联系方式: %@",model.userPhone];
    if ([model.status isEqualToString:@"0"]) {
        cell.statusLab.text=@"可用";
        [cell.statusLab setTextColor:COLOR_333333];
    }else{
         cell.statusLab.text=@"占用";
      [cell.statusLab setTextColor:[UIColor redColor]];;
    }
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.sectionArr.count;
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
    UILabel*lab;
    if (!lab) {
        lab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,40)];
        lab.backgroundColor=[UIColor blueColor];
        lab.textColor=[UIColor blackColor];
        lab.font=SYS_F(14);
             
    }
    lab.text=self.sectionArr[section];
    
    return lab;
}
#pragma mark -- Event Response
- (void)rightButonClick {
    TAAddFriendViewController *addFriendVC=[[TAAddFriendViewController alloc]init];
    [self.navigationController pushViewController:addFriendVC animated:NO];
}
#pragma mark -- GettersAndSetters
- (UITableView*)firendsListTableView {
    if (!_firendsListTableView) {
        _firendsListTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _firendsListTableView.backgroundColor = COLOR_ffffff;
        _firendsListTableView.rowHeight=80;
        _firendsListTableView.delegate=self;
        _firendsListTableView.dataSource=self;
        _firendsListTableView.showsHorizontalScrollIndicator=NO;
        _firendsListTableView.showsVerticalScrollIndicator=NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return _firendsListTableView;
}
- (NSMutableArray*)sectionArr {
    if (!_sectionArr) {
        _sectionArr=[[NSMutableArray alloc]init];
    }
    return _sectionArr;
}
- (NSMutableArray*)rowArr {
    if (!_rowArr) {
        _rowArr=[[NSMutableArray alloc]init];
    }
    return _rowArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
