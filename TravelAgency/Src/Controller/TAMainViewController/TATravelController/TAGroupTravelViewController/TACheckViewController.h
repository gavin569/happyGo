//
//  TACheckViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/20.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"

@interface TACheckViewController : TABaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSString *dateStr;
@property (nonatomic, strong) NSString *lineStr;
@property (nonatomic, strong) NSString *messageStr;
@property (weak, nonatomic) IBOutlet UILabel *lineLab;
@property (weak, nonatomic) IBOutlet UILabel *messageLab;
@property (weak, nonatomic) IBOutlet UIButton *touristSystemButton;
@property (nonatomic, strong) NSString *endDate;
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *dateLab;
@property (weak, nonatomic) IBOutlet UIButton *driverSystemButton;
@end
