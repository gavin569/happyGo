//
//  TASelfCenterViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/6.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TASelfCenterViewController.h"
#import "TASystemMessageViewController.h"
#import "TAFriendViewController.h"
#import "TALineListViewController.h"
#import "TAMyBillViewController.h"
#import "TAMyOrderListViewController.h"
#import "TAChangePassWordViewController.h"
#import "TAMyCarViewController.h"
#import "TAFillSelfMessageViewController.h"
@interface TASelfCenterViewController ()
{
    int _roleId;
}
@end

@implementation TASelfCenterViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"个人中心";
    [self.view addSubview:self.myCenterTableView];
   
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _listArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.imageView.image=[UIImage imageNamed:@"S_6.png"];
    cell.textLabel.text=_listArr[indexPath.row];
    cell.textLabel.font=SYS_F(14);
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *userDic=[TACommonTool userInfo];
    NSString *roleId=[NSString stringWithFormat:@"%@",userDic[@"roleId"]];
    _roleId=[roleId intValue];
    switch (_roleId) {
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    [TAAlertView showAlertWithTitle:@"温馨提示" contentView:nil message:@"是否完善资料" cancelTitle:@"取消" otherTitle:@"确定"  completion:^(BOOL cancelled) {
                        if (!cancelled) {
                            TAFillSelfMessageViewController * fillSelfMessageController=[[TAFillSelfMessageViewController alloc]init];
                            [self.navigationController pushViewController:fillSelfMessageController animated:NO];
                        }
                    }];
                }
                    break;
                case 1:
                {
                    TASystemMessageViewController*systemMessageVC=[[TASystemMessageViewController alloc]init];
                    [self.navigationController pushViewController:systemMessageVC animated:NO];
                }
                    break;
                case 2:
                {
                    TAFriendViewController*friendVC=[[TAFriendViewController alloc]init];
                    [self.navigationController pushViewController:friendVC animated:NO];
                }
                    break;
                case 3:
                {
                    TAMyBillViewController *myBillVC=[[TAMyBillViewController alloc]init];
                    [self.navigationController pushViewController:myBillVC animated:NO];
                }
                    break;
                case 4:
                {
                    TAChangePassWordViewController *changePassWordVC=[[TAChangePassWordViewController alloc]init];
                    [self.navigationController pushViewController:changePassWordVC animated:NO];
                }
                    break;
                case 5:
                {
                    [TAAlertView showAlertWithTitle:@"温馨提示" contentView:nil message:@"确认退出当前用户？" cancelTitle:@"取消" otherTitle:@"确定" completion:^(BOOL cancelled) {
                        if (cancelled==YES) {
                            NSLog(@"取消");
                        }else{
                            [TACommonTool removeUserInfo];
                            [TACommonTool gotoLoginVc];
                        }
                    }];
                }
                    break;
                    
                default:
                    break;
            }
 
        }
            break;
        case 2:
        {
            switch (indexPath.row) {
                case 0:
                {
                    [TAAlertView showAlertWithTitle:@"温馨提示" contentView:nil message:@"是否完善资料" cancelTitle:@"取消" otherTitle:@"确定"  completion:^(BOOL cancelled) {
                        if (!cancelled) {
                            TAFillSelfMessageViewController * fillSelfMessageController=[[TAFillSelfMessageViewController alloc]init];
                            [self.navigationController pushViewController:fillSelfMessageController animated:NO];
                        }
                    }];
                }
                    break;
                case 1:
                {
                    TASystemMessageViewController*systemMessageVC=[[TASystemMessageViewController alloc]init];
                    [self.navigationController pushViewController:systemMessageVC animated:NO];
                }
                    break;
                case 2:
                {
                    TAFriendViewController*friendVC=[[TAFriendViewController alloc]init];
                    [self.navigationController pushViewController:friendVC animated:NO];
                }
                    break;
                case 3:
                {
                    TALineListViewController*myLineList=[[TALineListViewController alloc]init];
                    [self.navigationController pushViewController:myLineList animated:NO];
                }
                    break;
                case 4:
                {
                    TAMyBillViewController *myBillVC=[[TAMyBillViewController alloc]init];
                    [self.navigationController pushViewController:myBillVC animated:NO];
                }
                    break;
                case 5:
                {
                    TAMyOrderListViewController *myOrderListVC=[[TAMyOrderListViewController alloc]init];
                    [self.navigationController pushViewController:myOrderListVC animated:NO];
                }
                    break;
                case 6:
                {
                    TAChangePassWordViewController *changePassWordVC=[[TAChangePassWordViewController alloc]init];
                    [self.navigationController pushViewController:changePassWordVC animated:NO];
                }
                    break;
                case 7:
                {
                    [TAAlertView showAlertWithTitle:@"温馨提示" contentView:nil message:@"确认退出当前用户？" cancelTitle:@"取消" otherTitle:@"确定" completion:^(BOOL cancelled) {
                        if (cancelled==YES) {
                            NSLog(@"取消");
                        }else{
                            [TACommonTool removeUserInfo];
                            [TACommonTool gotoLoginVc];
                        }
                    }];
                    
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case 3:
        {
            switch (indexPath.row) {
                case 0:
                {
                    [TAAlertView showAlertWithTitle:@"温馨提示" contentView:nil message:@"是否完善资料" cancelTitle:@"取消" otherTitle:@"确定"  completion:^(BOOL cancelled) {
                        if (!cancelled) {
                            TAFillSelfMessageViewController * fillSelfMessageController=[[TAFillSelfMessageViewController alloc]init];
                            [self.navigationController pushViewController:fillSelfMessageController animated:NO];
                        }
                    }];
                }
                    break;
                case 1:
                {
                    TASystemMessageViewController*systemMessageVC=[[TASystemMessageViewController alloc]init];
                    [self.navigationController pushViewController:systemMessageVC animated:NO];
                }
                    break;
                case 2:
                {
                    TAFriendViewController*friendVC=[[TAFriendViewController alloc]init];
                    [self.navigationController pushViewController:friendVC animated:NO];
                }
                    break;
                case 3:
                {
                    TAMyBillViewController *myBillVC=[[TAMyBillViewController alloc]init];
                    [self.navigationController pushViewController:myBillVC animated:NO];
                }
                    break;
                case 4:
                {
                    TAChangePassWordViewController *changePassWordVC=[[TAChangePassWordViewController alloc]init];
                    [self.navigationController pushViewController:changePassWordVC animated:NO];
                }
                    break;
                case 5:
                {
                    [TAAlertView showAlertWithTitle:@"温馨提示" contentView:nil message:@"确认退出当前用户？" cancelTitle:@"取消" otherTitle:@"确定" completion:^(BOOL cancelled) {
                        if (cancelled==YES) {
                            NSLog(@"取消");
                        }else{
                            [TACommonTool removeUserInfo];
                            [TACommonTool gotoLoginVc];
                        }
                    }];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case 4:
        {
            switch (indexPath.row) {
                case 0:
                {
                    [TAAlertView showAlertWithTitle:@"温馨提示" contentView:nil message:@"是否完善资料" cancelTitle:@"取消" otherTitle:@"确定"  completion:^(BOOL cancelled) {
                        if (!cancelled) {
                            TAFillSelfMessageViewController * fillSelfMessageController=[[TAFillSelfMessageViewController alloc]init];
                            [self.navigationController pushViewController:fillSelfMessageController animated:NO];
                        }
                    }];
                }
                    break;
                case 1:
                {
                    TASystemMessageViewController*systemMessageVC=[[TASystemMessageViewController alloc]init];
                    [self.navigationController pushViewController:systemMessageVC animated:NO];
                }
                    break;
                case 2:
                {
                    TAFriendViewController*friendVC=[[TAFriendViewController alloc]init];
                    [self.navigationController pushViewController:friendVC animated:NO];
                }
                    break;
                case 3:
                {
                    TAMyBillViewController *myBillVC=[[TAMyBillViewController alloc]init];
                    [self.navigationController pushViewController:myBillVC animated:NO];
                }
                    break;
                case 4:
                {
                    TAChangePassWordViewController *changePassWordVC=[[TAChangePassWordViewController alloc]init];
                    [self.navigationController pushViewController:changePassWordVC animated:NO];
                }
                    break;
                case 5:
                {
                    [TAAlertView showAlertWithTitle:@"温馨提示" contentView:nil message:@"确认退出当前用户？" cancelTitle:@"取消" otherTitle:@"确定" completion:^(BOOL cancelled) {
                        if (cancelled==YES) {
                            NSLog(@"取消");
                        }else{
                            [TACommonTool removeUserInfo];
                            [TACommonTool gotoLoginVc];
                        }
                    }];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case 5:
        { switch (indexPath.row) {
            case 0:
            {
                [TAAlertView showAlertWithTitle:@"温馨提示" contentView:nil message:@"是否完善资料" cancelTitle:@"取消" otherTitle:@"确定"  completion:^(BOOL cancelled) {
                    if (!cancelled) {
                        TAFillSelfMessageViewController * fillSelfMessageController=[[TAFillSelfMessageViewController alloc]init];
                        [self.navigationController pushViewController:fillSelfMessageController animated:NO];
                    }
                }];
            }
                break;
            case 1:
            {
                TASystemMessageViewController*systemMessageVC=[[TASystemMessageViewController alloc]init];
                [self.navigationController pushViewController:systemMessageVC animated:NO];
            }
                break;
            case 2:
            {
                TAFriendViewController*friendVC=[[TAFriendViewController alloc]init];
                [self.navigationController pushViewController:friendVC animated:NO];
            }
                break;
            case 3:
            {
                TAMyBillViewController *myBillVC=[[TAMyBillViewController alloc]init];
                [self.navigationController pushViewController:myBillVC animated:NO];
            }
                break;
            case 4:
            {
                TAMyCarViewController *myCarViewController=[[TAMyCarViewController alloc]init];
                [self.navigationController pushViewController:myCarViewController animated:NO];
            }
                break;
            case 5:
            {
                TAChangePassWordViewController *changePassWordVC=[[TAChangePassWordViewController alloc]init];
                [self.navigationController pushViewController:changePassWordVC animated:NO];
            }
                break;
            case 6:
            {
                [TAAlertView showAlertWithTitle:@"温馨提示" contentView:nil message:@"确认退出当前用户？" cancelTitle:@"取消" otherTitle:@"确定" completion:^(BOOL cancelled) {
                    if (cancelled==YES) {
                        NSLog(@"取消");
                    }else{
                        [TACommonTool removeUserInfo];
                        [TACommonTool gotoLoginVc];
                    }
                }];
            }
                break;
            default:
                break;
        }
        }
            break;
            
        default:
            break;
    }
   
}
#pragma mark -- GettersAndSetters
- (UITableView*)myCenterTableView {
    if (!_myCenterTableView) {
        _myCenterTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _myCenterTableView.backgroundColor = COLOR_ffffff;
        _myCenterTableView.scrollsToTop = YES;
        _myCenterTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _myCenterTableView.delegate=self;
        _myCenterTableView.dataSource=self;
        _myCenterTableView.showsHorizontalScrollIndicator=NO;
        _myCenterTableView.showsVerticalScrollIndicator=NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return _myCenterTableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
