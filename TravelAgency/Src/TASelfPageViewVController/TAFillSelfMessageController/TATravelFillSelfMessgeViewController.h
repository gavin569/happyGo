//
//  TATravelFillSelfMessgeViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/29.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"

@interface TATravelFillSelfMessgeViewController : TABaseViewController
@property (weak, nonatomic) IBOutlet UITextField *travelNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *travelAddressTextField;
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UIImageView *ZZImageView;
@property (weak, nonatomic) IBOutlet UIButton *updateButton;
@property (nonatomic, strong) UIView *bomView;

@end
