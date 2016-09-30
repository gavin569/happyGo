//
//  TAAddLineListViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"

@interface TAAddLineListViewController : TABaseViewController
@property (weak, nonatomic) IBOutlet UITextField *lineNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *FullFareTextField;
@property (weak, nonatomic) IBOutlet UITextField *halfFareTextField;
@property (weak, nonatomic) IBOutlet UILabel *lineContentLab;

@property (nonatomic, assign) BOOL isTGLine;
- (IBAction)contentViewedClick:(id)sender;


@end
