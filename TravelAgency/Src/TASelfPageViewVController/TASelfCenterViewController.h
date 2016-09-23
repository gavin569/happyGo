//
//  TASelfCenterViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/6.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"

@interface TASelfCenterViewController : TABaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *myCenterTableView;
@property (nonatomic, strong) NSArray *listArr;
@property (nonatomic, strong) NSArray *imageArr;
@end
