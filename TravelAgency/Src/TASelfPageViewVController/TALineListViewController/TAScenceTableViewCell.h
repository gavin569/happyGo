//
//  TAScenceTableViewCell.h
//  TravelAgency
//
//  Created by edianzu on 16/9/29.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TAScenceTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *JDLab;
@property (weak, nonatomic) IBOutlet UIImageView *JDImageView;
@property (weak, nonatomic) IBOutlet UILabel *allTicketLab;
@property (weak, nonatomic) IBOutlet UILabel *halfTicketLab;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;

@end
