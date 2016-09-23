//
//  TAAddFriendViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"
#import "TASelfCenterViewModel.h"
@interface TAAddFriendViewController : TABaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *searchTextFieldView;
- (IBAction)searchButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (nonatomic, strong) TASelfCenterViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UITableView *friendListTableView;

@end
