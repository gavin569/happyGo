//
//  TALineListViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"
#import "TASelfCenterViewModel.h"
@interface TALineListViewController : TABaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *lineListTableView;
@property (nonatomic, strong) TASelfCenterViewModel*viewModel;
@property (nonatomic, strong) NSMutableArray *lineListArr;
@end
