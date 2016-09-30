//
//  TAQueryLineMessageViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/26.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"

@interface TAQueryLineMessageViewController : TABaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *lineMessageTableView;
@property (nonatomic, strong) NSArray *lineMessageArr;
@property (nonatomic, strong) NSString *index;
@end
