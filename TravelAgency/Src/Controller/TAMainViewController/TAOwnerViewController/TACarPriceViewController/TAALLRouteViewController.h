//
//  TAALLRouteViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/14.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"
#import "TALineViewModel.h"
#import "TAOwnerHeaderView.h"
@interface TAALLRouteViewController : TABaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) TALineViewModel *viewModel;
@property (nonatomic, strong) NSMutableArray *travelArr;
@property (nonatomic, strong) NSMutableArray *lineArr;
@property (nonatomic, strong) UITableView *TAAllRoutesTableView;
@property (nonatomic, strong) TAOwnerHeaderView *headerView;
@end
