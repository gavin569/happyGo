//
//  TAMyOrderListViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"

@interface TAMyOrderListViewController : TABaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) UITableView *orderTableView;
@property (nonatomic, strong) NSMutableArray *orderListArr;
@end
