//
//  TAChangePassWordViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"
#import "TALoginAndRegisterViewModel.h"
@interface TAChangePassWordViewController : TABaseViewController
@property (nonatomic, strong) UILabel *topLab;
@property (nonatomic, strong) UITextField *YZMTextField;
@property (nonatomic, strong) UIButton *YZMButton;
@property (nonatomic, strong) TALoginAndRegisterViewModel *viewModel;
@end
