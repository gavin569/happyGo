//
//  TAAddressPickerViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/18.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAAddressPickerViewController.h"
#import "TASelectCityViewController.h"
@interface TAAddressPickerViewController ()<TAddressPickerDelegate,TAddressPickerDataSource>

@end

@implementation TAAddressPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"选择城市";
    TASelectCityViewController *addressPickerController = [[TASelectCityViewController alloc] initWithFrame:self.view.frame];
    addressPickerController.dataSource = self;
    addressPickerController.delegate = self;
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    [self addChildViewController:addressPickerController];
    [self.view addSubview:addressPickerController.view];
}

#pragma mark - BAddressController Delegate
- (NSArray*)arrayOfHotCitiesInAddressPicker:(TASelectCityViewController *)addressPicker{
    return @[@"北京",@"上海",@"深圳",@"杭州",@"广州",@"武汉",@"天津",@"重庆",@"成都",@"苏州"];
}


- (void)addressPicker:(TASelectCityViewController *)addressPicker didSelectedCity:(NSString *)city{
    if (_AddressBlock) {
        //调用 block 前需要判断 block 是否实现。
        _AddressBlock(city);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)beginSearch:(UISearchBar *)searchBar{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)endSearch:(UISearchBar *)searchBar{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
#pragma mark -- Event Response
- (void)leftButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
