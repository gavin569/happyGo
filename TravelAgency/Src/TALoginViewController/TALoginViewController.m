//
//  TALoginViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/6.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TALoginViewController.h"
#import "TARegisterOneViewController.h"
#import "TARoleButton.h"
@interface TALoginViewController ()

@end

@implementation TALoginViewController
#pragma mark -- view life cycle
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel=[[TALoginAndRegisterViewModel alloc]init];
    [self setupUI];
}
#pragma mark -- SetupUI
- (void)setupUI {
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"page.png"]];
    
    _passWordTextField.secureTextEntry=YES;
    
    _SRView.backgroundColor=[UIColor colorWithWhite:0 alpha:0.4];
    _SRView.layer.cornerRadius=5;
    _SRView.clipsToBounds=YES;
    
    _loginButton.layer.cornerRadius=4;
    _loginButton.clipsToBounds=YES;
    [_loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    _registerButton.layer.cornerRadius=4;
    _registerButton.clipsToBounds=YES;
    [_registerButton addTarget:self action:@selector(registerButtonClick) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark -- Event Response
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
- (void)loginButtonClick {
    [self.view endEditing:YES];
    if (_userNameTextField.text.length==11&&_passWordTextField.text.length>5) {
        [[TALoadingView shareLoadingViewWithTitle:@"正在登录中"]show];
        [_viewModel loginWithUserName:_userNameTextField.text passWord:_passWordTextField.text success:^(NSString*status,NSString*role) {
            if ([status isEqualToString:@"0"]) {
                [[TALoadingView shareLoadingViewWithTitle:@"正在登录中"]close];
                _gotoVc=[role integerValue];
                switch (_gotoVc) {
                    case gotoJiaoDanVC:
                    {
                        [TACommonTool gotoJiaoDanVc];
                    }
                        break;
                    case gotoTravelVC:
                    {
                        [TACommonTool gotoTraveHotelVc];
                    }
                        break;
                    case gotoDriverVC:
                    {
                        [TACommonTool gotoTraveDriverVc];
                    }
                        break;
                    case gotoTouristVC:
                    {
                        [TACommonTool gotoTraveTouristVc];
                    }
                        break;
                    case gotoOwnersVC:
                    {
                        [TACommonTool gotoOwnersVc];
                    }
                        break;
                        
                    default:
                        break;
                }
            }else{
                [[TALoadingView shareLoadingViewWithTitle:@"正在登录中"]close];
                [TAAlertView showAlertWithTitle:@"温馨提示" message:@"用户名和密码不匹配" cancelTitle:@"我知道了"];
            }
        } failure:^{
            [[TALoadingView shareLoadingViewWithTitle:@"正在登录中"]close];
             [TAAlertView showAlertWithTitle:@"温馨提示" message:@"网络异常，请稍后再试" cancelTitle:@"我知道了"];
        }];
    }else{
        [TAAlertView showAlertWithTitle:@"温馨提示" message:@"用户名或登录密码不正确" cancelTitle:@"我知道了"];
    }
   
    
}
- (void)registerButtonClick {
    [self.view addSubview:self.selectView];

}
- (void)categoryButonClick:(UIButton*)button {
    [_selectView removeFromSuperview];
    TARegisterOneViewController*registerVc=[[TARegisterOneViewController alloc]init];
    registerVc.navigationItem.title=@"注册";
    registerVc.role=(int)button.tag+1;
    [self.navigationController pushViewController:registerVc animated:NO];
    
}
//忘记密码
- (IBAction)forgetButton:(id)sender {
    TARegisterOneViewController*forgetVc=[[TARegisterOneViewController alloc]init];
    forgetVc.navigationItem.title=@"忘记密码";
    forgetVc.isChangePassWord=YES;
    [self.navigationController pushViewController:forgetVc animated:NO];
}
#pragma mark -- GettersAndSetters
- (UIView*)selectView {
    if (!_selectView) {
        _selectView=[[UIView alloc]initWithFrame:self.view.frame];
        _selectView.backgroundColor=[UIColor colorWithWhite:1 alpha:0.5];
        UIView*centetrView=[[UIView alloc]init];
        float width=(SCREEN_WIDTH-65)/4;
        [_selectView addSubview:centetrView];
        [centetrView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_selectView);
            make.left.equalTo(_selectView.mas_left).with.offset(20);
            make.right.equalTo(_selectView.mas_right).with.offset(-20);
            make.height.equalTo(@(width*2+15));
        }];
        for (int i=0; i<8; i++) {
            float b=i%4;
            float c=i/4;
            TARoleButton*categoryButon=[TARoleButton buttonWithType:UIButtonTypeCustom];
            categoryButon.tag=i;
            categoryButon.frame=CGRectMake(5+(width+5)*b, 5+(width+15)*c, width, width+10);
           categoryButon.topImageView.image=[UIImage imageNamed:@"man_yes.png"];
            categoryButon.bomLab.text=self.listArr[i];
            [categoryButon addTarget:self action:@selector(categoryButonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [centetrView addSubview:categoryButon];
        }
    }
    return _selectView;
}
- (NSArray*)listArr {
    if (!_listArr) {
        _listArr=[[NSArray alloc]initWithObjects:@"交单",@"旅行社",@"司机",@"导游",@"车主",@"餐厅",@"购物点",@"交单",@"酒店", nil];
    }
    return _listArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
