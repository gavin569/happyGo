//
//  TAFriendViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"
#import "TASelfCenterViewModel.h"
@interface TAFriendViewController : TABaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) TASelfCenterViewModel *viewModel;
@property (nonatomic, strong) UITableView *firendsListTableView;
@property (nonatomic, strong) NSMutableArray *sectionArr;
@property (nonatomic, strong) NSMutableArray *rowArr;
@end
