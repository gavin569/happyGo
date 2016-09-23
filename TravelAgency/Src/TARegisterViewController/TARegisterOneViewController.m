//
//  TARegisterOneViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/6.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TARegisterOneViewController.h"
#import "TARegisterViewController.h"
@interface TARegisterOneViewController ()
{
    NSString *_code;
     NSTimer *_timer;
    
}
@end

@implementation TARegisterOneViewController

#pragma mark -- view life cycle
- (void)viewWillLayoutSubviews {
    [_phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.top.equalTo(self.view.mas_top).with.offset(80);
    }];
    [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.top.equalTo(_phoneLab.mas_bottom).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-100);
        make.height.equalTo(@30);
    }];
    [_yzmTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.top.equalTo(_phoneTextField.mas_bottom).with.offset(10);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    [_FSButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_yzmTextField.mas_right).with.offset(20);
        make.top.equalTo(_phoneTextField.mas_bottom).with.offset(10);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [_timer invalidate];
    _timer = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel=[[TALoginAndRegisterViewModel alloc]init];
    [self customNavigationBarRightItemWithTitle:@"下一步" action:@selector(NextButtonClick)];
    [self.view addSubview:self.phoneLab];
    [self.view addSubview:self.phoneTextField];
    [self.view addSubview:self.yzmTextField];
    [self.view addSubview:self.FSButton];
}
#pragma mark -- Event Response
- (void)NextButtonClick {
    [self.view endEditing:YES];
//    首先验证验证码是否正确
    if ([_yzmTextField.text isEqualToString:[NSString stringWithFormat:@"%@",_code]]) {
        TARegisterViewController*registerVc=[[TARegisterViewController alloc]init];
        registerVc.role=_role;
        registerVc.titleStr=@"输入密码";
        registerVc.isChangePassword=_isChangePassWord;
        registerVc.userPhone=_phoneTextField.text;
        [self.navigationController pushViewController:registerVc animated:NO];
    }else{
        [TAAlertView showAlertWithTitle:@"温馨提示" message:@"验证码不正确" cancelTitle:@"我知道了"];
    }
}
- (void)FSButtonClick {
//    首先对手机号进行判断
    BOOL isPhone=[TACommonTool valiMobile:_phoneTextField.text];
    if (isPhone==YES) {
        _FSButton.enabled=NO;
        _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(Countdown:) userInfo:nil     repeats:YES];
        [_viewModel requestCodeWithUserPhoneNumber:_phoneTextField.text flag:0 success:^(NSString *status) {
            _code=status;
            NSLog(@"AAA----%@",_code);
        } failure:^{
            
        }];
    }else{
        [TAAlertView showAlertWithTitle:@"温馨提示" message:@"手机号码不存在" cancelTitle:@"我知道了"];
    }
}
#pragma mark -- PrivateMethod
//验证码倒计时
- (void)Countdown:(NSTimer *)timer
{
    static NSInteger seconds = 60;
    seconds = seconds - 1;
    if (seconds < 1)
    {
        [_FSButton setTitle:@"重新获取" forState:UIControlStateNormal];
        [timer invalidate];
        seconds = 60;
        _FSButton.enabled = YES;
    }
    else
    {
        _FSButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        NSString *title =[NSString stringWithFormat:@"(%ld)s后重新发送", (long)seconds];
        [_FSButton setTitle:title forState:UIControlStateNormal];
    }
}
#pragma mark -- GettersAndSetters
- (UILabel*)phoneLab {
    if (!_phoneLab) {
        _phoneLab=[[UILabel alloc]init];
        _phoneLab.text=@"请输入手机号码:";
        _phoneLab.font=[UIFont systemFontOfSize:17];
        _phoneLab.textColor=[UIColor blackColor];
    }
    return _phoneLab;
}
- (UITextField*)phoneTextField {
    if (!_phoneTextField) {
        _phoneTextField=[[UITextField alloc]init];
        _phoneTextField.layer.borderWidth=1;
        _phoneTextField.layer.cornerRadius=4;
        _phoneTextField.layer.borderColor=[UIColor blueColor].CGColor;
        _phoneTextField.placeholder=@"请输入手机号码";
        _phoneTextField.textAlignment=NSTextAlignmentCenter;
        _phoneTextField.font=[UIFont systemFontOfSize:14];
        _phoneTextField.keyboardType=UIKeyboardTypeNumberPad;
    }
    return _phoneTextField;
}
- (UITextField*)yzmTextField {
    if (!_yzmTextField) {
        _yzmTextField=[[UITextField alloc]init];
        _yzmTextField.placeholder=@"请输入验证码";
        _yzmTextField.font=SYS_F(14);
        _yzmTextField.layer.borderWidth=1;
        _yzmTextField.layer.cornerRadius=4;
        _yzmTextField.layer.borderColor=[UIColor blueColor].CGColor;
        _yzmTextField.textAlignment=NSTextAlignmentCenter;
        _yzmTextField.font=[UIFont systemFontOfSize:14];
        _yzmTextField.keyboardType=UIKeyboardTypeNumberPad;
        
    }
    return _yzmTextField;
}
- (UIButton*)FSButton {
    if (!_FSButton) {
        _FSButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_FSButton setTitle:@"发送验证码" forState:UIControlStateNormal];
        _FSButton.layer.cornerRadius=5;
        _FSButton.clipsToBounds=YES;
        _FSButton.titleLabel.font=[UIFont systemFontOfSize:12];
        _FSButton.backgroundColor=[UIColor blueColor];
        _FSButton.titleLabel.textColor=[UIColor whiteColor];
        [_FSButton addTarget:self action:@selector(FSButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _FSButton;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
