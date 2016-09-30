//
//  TADetailLineMessageViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/26.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"
#import "TAJiaoDanModel.h"
#import "WJDatePickerView.h"
#import "TAJiaoDanViewModel.h"
@interface TADetailLineMessageViewController : TABaseViewController
@property (weak, nonatomic) IBOutlet UIButton *dateButton;
@property (weak, nonatomic) IBOutlet UITextField *allTicketTextField;
@property (weak, nonatomic) IBOutlet UITextField *halfTextField;
@property (weak, nonatomic) IBOutlet UITextField *fireTicketTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UIButton *changePhoneButton;
@property (weak, nonatomic) IBOutlet UITextField *YSTextField;
@property (weak, nonatomic) IBOutlet UITextField *CSTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLab;
@property (nonatomic, strong) TAJiaoDanModel*model;
@property (nonatomic, strong) WJDatePickerView*datePicker;
@property (nonatomic, strong) NSString*lineIdStr;
@property (nonatomic, strong) TAJiaoDanViewModel*viewModel;
@end
