//
//  TATBillTableViewCell.h
//  TravelAgency
//
//  Created by edianzu on 16/9/28.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TATBillTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLab;
@property (weak, nonatomic) IBOutlet UILabel *sourceLab;
@property (weak, nonatomic) IBOutlet UILabel *moneyLab;
@property (weak, nonatomic) IBOutlet UILabel *remarkLab;

@end
