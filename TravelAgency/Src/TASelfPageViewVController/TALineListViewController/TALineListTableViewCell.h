//
//  TALineListTableViewCell.h
//  TravelAgency
//
//  Created by edianzu on 16/9/29.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TALineListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lineNameLab;
@property (weak, nonatomic) IBOutlet UILabel *lineContentLab;
@property (weak, nonatomic) IBOutlet UILabel *allTicketLab;
@property (weak, nonatomic) IBOutlet UILabel *halfTicketLab;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end
