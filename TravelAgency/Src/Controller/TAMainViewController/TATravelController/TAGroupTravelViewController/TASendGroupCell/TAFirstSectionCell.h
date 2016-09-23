//
//  TAFirstSectionCell.h
//  TravelAgency
//
//  Created by edianzu on 16/9/20.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TAFirstSectionCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *selectDateButton;
@property (weak, nonatomic) IBOutlet UIButton *selectVehicleButton;
@property (weak, nonatomic) IBOutlet UIButton *selectTimeButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@end
