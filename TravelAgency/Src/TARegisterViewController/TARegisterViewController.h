//
//  TARegisterViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/6.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"
#import "TALoginAndRegisterViewModel.h"
@interface TARegisterViewController : TABaseViewController
@property (weak, nonatomic) IBOutlet UITextField *loginPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *surePasswordTextField;
@property (assign, nonatomic) int role;
@property (strong, nonatomic) NSString *userPhone;
@property (nonatomic, strong) TALoginAndRegisterViewModel*viewModel;
@property (nonatomic, strong) NSString *titleStr;
@property (nonatomic, assign) BOOL isChangePassword;
@end
