//
//  TAFillSelfMessageViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/19.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAFillSelfMessageViewController.h"

@interface TAFillSelfMessageViewController ()
{
    UILabel *_nameLab;
    UILabel *_idCardNumberLab;
    UILabel *_idCarLab;
    UILabel *_companyNameLab;
    UILabel *_userNameLab;
    UILabel *_ZZLab;
    UITextField *_nameTextField;
    UITextField *_idNumberTextField;
    UIImageView *_idCardImageView;
    UITextField *_companyNameTextField;
    UITextField *_userNameTextField;
    UIImageView *_ZZImageView;
    UIButton *_updateImageButton;
    UIButton *_updateZZImageButton;
    
}
@end

@implementation TAFillSelfMessageViewController
#pragma mark -- view life cycle
- (void)viewWillLayoutSubviews{
    [_topSegControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).with.offset(70);
        make.height.equalTo(@30);
        make.width.equalTo(@240);
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"完善资料";
    [self customNavigationBarRightItemWithTitle:@"提交" action:@selector(submitButtonClick)];
    self.view.backgroundColor=COLOR_f1f1f1;
    [self.view addSubview:self.topSegControl];
    [self.view addSubview:self.bgScroView];
    [_bgScroView addSubview:self.leftView];
    [_bgScroView addSubview:self.rightView];
}
#pragma mark -- Event Response
- (void)segmentControlPageChange:(UISegmentedControl*)sender{
    
    [_bgScroView setContentOffset:CGPointMake(_bgScroView.frame.size.width*sender.selectedSegmentIndex, 0) animated:YES];
}
//上传图片
- (void)updateImageButtonClick{
   
   [self.view addSubview:self.bomView];
}
//上传营业执照
- (void)updateZZImageButtonClick {
    
}
//提交资料按钮
- (void)submitButtonClick{
    
}
//上传图片
- (void)leftButtonClick{
    
}
//上传照片
- (void)centerButtonClick{
    
}
//取消
- (void)rightButtonClick{
    [_bomView removeFromSuperview];
}
#pragma mark -- GettersAndSetters
- (UISegmentedControl*)topSegControl{
    if (!_topSegControl) {
        _topSegControl = [[UISegmentedControl alloc] initWithItems:@[@"个人",@"企业／单位"]];
        _topSegControl.selectedSegmentIndex = 0;
        [_topSegControl addTarget:self action:@selector(segmentControlPageChange:) forControlEvents:UIControlEventValueChanged];
    }
    
    return _topSegControl;
}
- (UIScrollView*)bgScroView{
    if (!_bgScroView) {
        _bgScroView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 110, SCREEN_WIDTH, SCREEN_HEIGHT-110)];
        _bgScroView.contentSize = CGSizeMake(SCREEN_WIDTH*2, SCREEN_HEIGHT-110);
        _bgScroView.pagingEnabled = YES;
        _bgScroView.scrollEnabled=NO;
        _bgScroView.showsHorizontalScrollIndicator = NO;
        _bgScroView.showsVerticalScrollIndicator=NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return _bgScroView;
}
- (UIView*)leftView{
    if (!_leftView) {
        _leftView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-110)];
        _nameLab=[[UILabel alloc]init];
        _nameLab.text=@"姓名:";
        _nameLab.font=SYS_F(12);
        [_leftView addSubview:_nameLab];
        [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_leftView.mas_top).with.offset(5);
            make.left.equalTo(_leftView.mas_left).with.offset(11);
            make.width.equalTo(@40);
            make.height.equalTo(@30);
        }];
        _nameTextField=[[UITextField alloc]init];
        _nameTextField.font=SYS_F(12);
        _nameTextField.borderStyle=UITextBorderStyleNone;
        _nameTextField.placeholder=@"请填写姓名";
        [_leftView addSubview:_nameTextField];
        [_nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_leftView.mas_top).with.offset(5);
            make.left.equalTo(_nameLab.mas_right).with.offset(5);
            make.right.equalTo(_leftView.mas_right).with.offset(-5);
            make.height.equalTo(@30);
        }];
        UIView *lineView=[[UIView alloc]init];
        lineView.backgroundColor=COLOR_d1d1d1;
        [_leftView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_nameLab.mas_bottom).with.offset(5);
            make.left.equalTo(_leftView);
            make.right.equalTo(_leftView);
            make.height.equalTo(@1);
        }];
        _idCardNumberLab=[[UILabel alloc]init];
        _idCardNumberLab.text=@"身份证号:";
        _idCardNumberLab.font=SYS_F(12);
        [_leftView addSubview:_idCardNumberLab];
        [_idCardNumberLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineView.mas_bottom).with.offset(5);
            make.left.equalTo(_leftView.mas_left).with.offset(11);
            make.width.equalTo(@60);
            make.height.equalTo(@30);
        }];
        _idNumberTextField=[[UITextField alloc]init];
        _idNumberTextField.font=SYS_F(12);
        _idNumberTextField.borderStyle=UITextBorderStyleNone;
        _idNumberTextField.placeholder=@"请填写身份证号码";
        [_leftView addSubview:_idNumberTextField];
        [_idNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineView.mas_bottom).with.offset(5);
            make.left.equalTo(_idCardNumberLab.mas_right).with.offset(11);
            make.right.equalTo(_leftView.mas_right).with.offset(-5);
            make.height.equalTo(@30);
        }];
        UIView *lineViewTwo=[[UIView alloc]init];
        lineViewTwo.backgroundColor=COLOR_d1d1d1;
        [_leftView addSubview:lineViewTwo];
        [lineViewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_idCardNumberLab.mas_bottom).with.offset(5);
            make.left.equalTo(_leftView);
            make.right.equalTo(_leftView);
            make.height.equalTo(@1);
        }];
        _idCarLab=[[UILabel alloc]init];
        _idCarLab.text=@"身份证号:";
        _idCarLab.font=SYS_F(12);
        [_leftView addSubview:_idCarLab];
        [_idCarLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineViewTwo.mas_bottom).with.offset(25);
            make.left.equalTo(_leftView.mas_left).with.offset(11);
            make.width.equalTo(@60);
            make.height.equalTo(@30);
        }];
        _idCardImageView=[[UIImageView alloc]init];
        _idCardImageView.image=[UIImage imageNamed:@"S_6.png"];
        [_leftView addSubview:_idCardImageView];
        [_idCardImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineViewTwo.mas_bottom).with.offset(5);
            make.left.equalTo(_idCarLab.mas_right).with.offset(20);
            make.width.equalTo(@70);
            make.height.equalTo(@70);
        }];
        _updateImageButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_updateImageButton setTitle:@"上传" forState:UIControlStateNormal];
        [_updateImageButton setBackgroundColor:[UIColor blueColor]];
        [_updateImageButton setTitleColor:COLOR_ffffff forState:UIControlStateNormal];
        [_updateImageButton addTarget:self action:@selector(updateImageButtonClick) forControlEvents:UIControlEventTouchUpInside];
        _updateImageButton.titleLabel.font=SYS_F(12);
        _updateImageButton.layer.cornerRadius=4.0f;
        _updateImageButton.clipsToBounds=YES;
        [_leftView addSubview:_updateImageButton];
        [_updateImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineViewTwo.mas_bottom).with.offset(25);
            make.right.equalTo(_leftView.mas_right).with.offset(-11);
            make.width.equalTo(@60);
            make.height.equalTo(@30);
        }];
        UIView *lineViewThird=[[UIView alloc]init];
        lineViewThird.backgroundColor=COLOR_d1d1d1;
        [_leftView addSubview:lineViewThird];
        [lineViewThird mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_idCarLab.mas_bottom).with.offset(25);
            make.left.equalTo(_leftView);
            make.right.equalTo(_leftView);
            make.height.equalTo(@1);
        }];
      
                            
    }
    return _leftView;
}
- (UIView*)rightView{
    if (!_rightView) {
        _rightView=[[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-110)];
        _companyNameLab=[[UILabel alloc]init];
        _companyNameLab.text=@"单位名称:";
        _companyNameLab.font=SYS_F(12);
        [_rightView addSubview:_companyNameLab];
        [_companyNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_rightView.mas_top).with.offset(5);
            make.left.equalTo(_rightView.mas_left).with.offset(11);
            make.width.equalTo(@60);
            make.height.equalTo(@30);
        }];
        _companyNameTextField=[[UITextField alloc]init];
        _companyNameTextField.font=SYS_F(12);
        _companyNameTextField.borderStyle=UITextBorderStyleNone;
        _companyNameTextField.placeholder=@"请填写单位名称";
        [_rightView addSubview:_companyNameTextField];
        [_companyNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_rightView.mas_top).with.offset(5);
            make.left.equalTo(_companyNameLab.mas_right).with.offset(5);
            make.right.equalTo(_rightView.mas_right).with.offset(-5);
            make.height.equalTo(@30);
        }];
        UIView *lineView=[[UIView alloc]init];
        lineView.backgroundColor=COLOR_d1d1d1;
        [_rightView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_companyNameLab.mas_bottom).with.offset(5);
            make.left.equalTo(_rightView);
            make.right.equalTo(_rightView);
            make.height.equalTo(@1);
        }];
        _userNameLab=[[UILabel alloc]init];
        _userNameLab.text=@"联系人:";
        _userNameLab.font=SYS_F(12);
        [_rightView addSubview:_userNameLab];
        [_userNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineView.mas_bottom).with.offset(5);
            make.left.equalTo(_rightView.mas_left).with.offset(11);
            make.width.equalTo(@60);
            make.height.equalTo(@30);
        }];
        _userNameTextField=[[UITextField alloc]init];
        _userNameTextField.font=SYS_F(12);
        _userNameTextField.borderStyle=UITextBorderStyleNone;
        _userNameTextField.placeholder=@"请填写联系人信息";
        [_rightView addSubview:_userNameTextField];
        [_userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineView.mas_bottom).with.offset(5);
            make.left.equalTo(_userNameLab.mas_right).with.offset(11);
            make.right.equalTo(_rightView.mas_right).with.offset(-5);
            make.height.equalTo(@30);
        }];
        UIView *lineViewTwo=[[UIView alloc]init];
        lineViewTwo.backgroundColor=COLOR_d1d1d1;
        [_rightView addSubview:lineViewTwo];
        [lineViewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_userNameLab.mas_bottom).with.offset(5);
            make.left.equalTo(_rightView);
            make.right.equalTo(_rightView);
            make.height.equalTo(@1);
        }];
        _ZZLab=[[UILabel alloc]init];
        _ZZLab.text=@"营业执照:";
        _ZZLab.font=SYS_F(12);
        [_rightView addSubview:_ZZLab];
        [_ZZLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineViewTwo.mas_bottom).with.offset(25);
            make.left.equalTo(_rightView.mas_left).with.offset(11);
            make.width.equalTo(@60);
            make.height.equalTo(@30);
        }];
        _ZZImageView=[[UIImageView alloc]init];
        _ZZImageView.image=[UIImage imageNamed:@"S_6.png"];
        [_rightView addSubview:_ZZImageView];
        [_ZZImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineViewTwo.mas_bottom).with.offset(5);
            make.left.equalTo(_ZZLab.mas_right).with.offset(20);
            make.width.equalTo(@70);
            make.height.equalTo(@70);
        }];
        _updateZZImageButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_updateZZImageButton setTitle:@"上传" forState:UIControlStateNormal];
        [_updateZZImageButton setBackgroundColor:[UIColor blueColor]];
        [_updateZZImageButton setTitleColor:COLOR_ffffff forState:UIControlStateNormal];
        [_updateZZImageButton addTarget:self action:@selector(updateZZImageButtonClick) forControlEvents:UIControlEventTouchUpInside];
        _updateZZImageButton.titleLabel.font=SYS_F(12);
        _updateZZImageButton.layer.cornerRadius=4.0f;
        _updateZZImageButton.clipsToBounds=YES;
        [_rightView addSubview:_updateZZImageButton];
        [_updateZZImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineViewTwo.mas_bottom).with.offset(25);
            make.right.equalTo(_rightView.mas_right).with.offset(-11);
            make.width.equalTo(@60);
            make.height.equalTo(@30);
        }];
        UIView *lineViewThird=[[UIView alloc]init];
        lineViewThird.backgroundColor=COLOR_d1d1d1;
        [_rightView addSubview:lineViewThird];
        [lineViewThird mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_ZZLab.mas_bottom).with.offset(25);
            make.left.equalTo(_rightView);
            make.right.equalTo(_rightView);
            make.height.equalTo(@1);
        }];
    }
    return _rightView;
}
- (UIView*)bomView{
    if (!_bomView) {
        _bomView=[[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-80,SCREEN_WIDTH, 80)];

        UIButton *leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.backgroundColor=[UIColor redColor];
        [leftButton setImage:[UIImage imageNamed:@"S_6.png"] forState:UIControlStateNormal];
        leftButton.frame=CGRectMake(0, 0, SCREEN_WIDTH/3, 80);
        [leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_bomView addSubview:leftButton];
        
        UIButton *centerButton=[UIButton buttonWithType:UIButtonTypeCustom];
        centerButton.backgroundColor=[UIColor yellowColor];
        centerButton.frame=CGRectMake(SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3, 80);
         [centerButton setImage:[UIImage imageNamed:@"S_6.png"] forState:UIControlStateNormal];
        [centerButton addTarget:self action:@selector(centerButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_bomView addSubview:centerButton];
        
        UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.backgroundColor=[UIColor redColor];
        rightButton.frame=CGRectMake(2*SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3, 80);
         [rightButton setImage:[UIImage imageNamed:@"S_6.png"] forState:UIControlStateNormal];
        [rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_bomView addSubview:rightButton];
    }
    return _bomView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
