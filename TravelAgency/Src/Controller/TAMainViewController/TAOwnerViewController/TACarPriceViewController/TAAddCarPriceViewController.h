//
//  TAAddCarPriceViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/14.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"
#import "TAOwnerViewModel.h"
@interface TAAddCarPriceViewController : TABaseViewController<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *selectLineButton;
@property (weak, nonatomic) IBOutlet UIButton *selectCarButton;
@property (weak, nonatomic) IBOutlet UITextField *journeyDistanceTextField;
@property (weak, nonatomic) IBOutlet UITextField *rateTextField;
@property (weak, nonatomic) IBOutlet UITextField *stopCostTextField;
@property (weak, nonatomic) IBOutlet UITextField *allowanceTextField;
@property (weak, nonatomic) IBOutlet UITextField *LargePackageTextField;
@property (weak, nonatomic) IBOutlet UITextField *smallPackageTextField;
@property (weak, nonatomic) IBOutlet UIView *bomView;
@property (strong, nonatomic) UILabel *selectWriteLab;
@property (strong, nonatomic) UITextView *selectWriteTextView;
@property (nonatomic, strong) TAOwnerViewModel *viewModel;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UIPickerView *pickView;
@property (nonatomic, strong) NSMutableArray *carTypeArr;
@property (nonatomic, strong) UIView *bigBomView;
@end
