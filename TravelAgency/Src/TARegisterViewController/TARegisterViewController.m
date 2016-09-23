//
//  TARegisterViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/6.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TARegisterViewController.h"

@interface TARegisterViewController ()

@end

@implementation TARegisterViewController
#pragma mark -- view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel=[[TALoginAndRegisterViewModel alloc]init];
    self.navigationItem.title=_titleStr;
    [self customNavigationBarRightItemWithTitle:@"提交" action:@selector(NextButtonClick)];
    _loginPasswordTextField.secureTextEntry=YES;
    _surePasswordTextField.secureTextEntry=YES;
}
#pragma mark -- Event Response
- (void) NextButtonClick {
    [self.view endEditing:YES];
    if (_loginPasswordTextField.text.length>5&&[_loginPasswordTextField.text isEqualToString:_surePasswordTextField.text]) {
        if (_isChangePassword==YES) {
          [_viewModel changePassWordWithUserPhone:_userPhone passWord:_loginPasswordTextField.text success:^(NSString *status) {
              if ([status isEqualToString:@"0"]) {
                  [TAAlertView showAlertWithTitle:@"温馨提示" contentView:nil message:@"密码修改成功" cancelTitle:@"我知道了" otherTitle:nil completion:^(BOOL cancelled) {
                      [self.navigationController popViewControllerAnimated:YES];
                  }];
              }else{
                  [TAAlertView showAlertWithTitle:@"温馨提示" message:@"密码修改失败，请稍后再试" cancelTitle:@"我知道了"];
              }
          } failure:^{
              
          }];
        }else{
            [_viewModel registerWithUesrPhoneNumer:_userPhone role:_role passWord:_loginPasswordTextField.text success:^(NSString *status) {
                if ([status isEqualToString:@"0"]) {
                    [TAAlertView showAlertWithTitle:@"温馨提示" contentView:nil message:@"注册成功" cancelTitle:@"我知道了" otherTitle:nil completion:^(BOOL cancelled) {
                        [self.navigationController popToRootViewControllerAnimated:YES];
                    }];
                }else{
                    [TAAlertView showAlertWithTitle:@"温馨提示" message:@"注册失败，请稍后再试" cancelTitle:@"我知道了"];
                }
            } failure:^{
                [TAAlertView showAlertWithTitle:@"温馨提示" message:@"手机号码已存在" cancelTitle:@"我知道了"];
            }];
        }
        
    }else{
      [TAAlertView showAlertWithTitle:@"温馨提示" message:@"密码不一致" cancelTitle:@"我知道了"];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
