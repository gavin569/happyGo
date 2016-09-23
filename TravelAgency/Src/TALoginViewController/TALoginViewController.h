//
//  TALoginViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/6.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TALoginAndRegisterViewModel.h"
@interface TALoginViewController : UIViewController
typedef enum {
    gotoJiaoDanVC=1,
    gotoTravelVC,
    gotoDriverVC,
    gotoTouristVC,
    gotoOwnersVC,
} ENUM_GotoVC_Type;
@property (weak, nonatomic) IBOutlet UIView *SRView;
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (strong, nonatomic) UIView *selectView;
@property (strong, nonatomic) NSArray *listArr;
@property (strong, nonatomic) TALoginAndRegisterViewModel*viewModel;
- (IBAction)forgetButton:(id)sender;

@property (nonatomic,assign) NSInteger gotoVc;
@end
