//
//  TAChangePassWordViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAChangePassWordViewController.h"
#import "TARegisterViewController.h"
@interface TAChangePassWordViewController ()
{
    NSString *_code;
    NSTimer *_timer;
    NSString *_userPhone;
}
@end

@implementation TAChangePassWordViewController
#pragma mark -- view life cycle
- (void)viewWillLayoutSubviews {
    [_topLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(70);
        make.left.equalTo(self.view.mas_left).with.offset(20);
        make.right.equalTo(self.view.mas_right).with.offset(-20);
    }];
    [_YZMTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.top.equalTo(_topLab.mas_bottom).with.offset(20);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    [_YZMButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_YZMTextField.mas_right).with.offset(20);
        make.top.equalTo(_topLab.mas_bottom).with.offset(20);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [_timer invalidate];
    _timer = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel=[[TALoginAndRegisterViewModel alloc]init];
    NSDictionary *userDic=[TACommonTool userInfo];
    _userPhone=[NSString stringWithFormat:@"%@",userDic[@"userPhone"]];
    self.navigationItem.title=@"修改密码";
    [self customNavigationBarRightItemWithTitle:@"下一步" action:@selector(rightButtonClick)];
    [self.view addSubview:self.topLab];
    [self.view addSubview:self.YZMTextField];
    [self.view addSubview:self.YZMButton];
}
#pragma mark -- Event Response
- (void)rightButtonClick {
    [self.view endEditing:YES];
    //    首先验证验证码是否正确
    if ([_YZMTextField.text isEqualToString:[NSString stringWithFormat:@"%@",_code]]) {
        TARegisterViewController*registerVc=[[TARegisterViewController alloc]init];
        registerVc.isChangePassword=YES;
        registerVc.titleStr=@"输入新密码";
        registerVc.userPhone=_userPhone;
        [self.navigationController pushViewController:registerVc animated:NO];
    }else{
        [TAAlertView showAlertWithTitle:@"温馨提示" message:@"验证码不正确" cancelTitle:@"我知道了"];
    }
}
- (void)FSButtonClick {
    [self.view endEditing:YES];
        _YZMButton.enabled=NO;
        _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(Countdown:) userInfo:nil repeats:YES];
        [_viewModel requestCodeWithUserPhoneNumber:_userPhone flag:1 success:^(NSString *status) {
            _code=status;
            NSLog(@"AAA----%@",_code);
        } failure:^{
            
        }];
}
#pragma mark -- PrivateMethod
//验证码倒计时
- (void)Countdown:(NSTimer *)timer
{
    static NSInteger seconds = 60;
    seconds = seconds - 1;
    if (seconds < 1)
    {
        [_YZMButton setTitle:@"重新获取" forState:UIControlStateNormal];
        [timer invalidate];
        seconds = 60;
        _YZMButton.enabled = YES;
    }
    else
    {
        _YZMButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        NSString *title =[NSString stringWithFormat:@"(%ld)s后重新发送", (long)seconds];
        [_YZMButton setTitle:title forState:UIControlStateNormal];
    }
}

#pragma mark -- GettersAndSetters
- (UILabel*)topLab {
    if (!_topLab) {
        _topLab=[[UILabel alloc]init];
        NSDictionary *userDic=[TACommonTool userInfo];
        NSString *userPhone=[NSString stringWithFormat:@"%@",userDic[@"userPhone"]];
        NSString *userPhoneStr = [userPhone stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
        _topLab.text=[NSString stringWithFormat:@"发送验证码至%@,请注意查收",userPhoneStr];
        _topLab.numberOfLines=0;
        _topLab.textColor=COLOR_333333;
        
    }
   return _topLab;
}
- (UITextField*)YZMTextField {
    if (!_YZMTextField) {
        _YZMTextField=[[UITextField alloc]init];
        _YZMTextField.placeholder=@"请输入验证码";
        _YZMTextField.font=SYS_F(14);
        _YZMTextField.layer.borderWidth=1;
        _YZMTextField.layer.cornerRadius=4;
        _YZMTextField.layer.borderColor=[UIColor blueColor].CGColor;
        _YZMTextField.textAlignment=NSTextAlignmentCenter;
        _YZMTextField.font=[UIFont systemFontOfSize:14];
        _YZMTextField.keyboardType=UIKeyboardTypeNumberPad;
        
    }
    return _YZMTextField;
}
- (UIButton*)YZMButton {
    if (!_YZMButton) {
        _YZMButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_YZMButton setTitle:@"发送验证码" forState:UIControlStateNormal];
        _YZMButton.layer.cornerRadius=5;
        _YZMButton.clipsToBounds=YES;
        _YZMButton.titleLabel.font=[UIFont systemFontOfSize:12];
        _YZMButton.backgroundColor=[UIColor blueColor];
        _YZMButton.titleLabel.textColor=[UIColor whiteColor];
        [_YZMButton addTarget:self action:@selector(FSButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _YZMButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
