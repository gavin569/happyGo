//
//  TAMyBillViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/28.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"
#import "TASelfCenterViewModel.h"
@interface TAMyBillViewController : TABaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *billTableView;
@property (nonatomic, strong) NSMutableArray *billListArr;
@property (nonatomic, strong) TASelfCenterViewModel*viewModel;
@end
