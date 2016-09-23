//
//  TARegisterOneViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/6.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"
#import "TALoginAndRegisterViewModel.h"
@interface TARegisterOneViewController : TABaseViewController
@property (nonatomic, strong) UILabel *phoneLab;
@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, strong) UITextField *yzmTextField;
@property (nonatomic, strong) UIButton *FSButton;
@property (nonatomic, assign) int role;
@property (nonatomic, strong) NSString *titleStr;
@property (nonatomic, strong) TALoginAndRegisterViewModel*viewModel;
@property (nonatomic, assign) BOOL isChangePassWord;
@end
