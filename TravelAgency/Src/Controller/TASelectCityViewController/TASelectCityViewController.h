//
//  TASelectCityViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/18.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"
@class TASelectCityViewController;

@protocol TAddressPickerDataSource <NSObject>

@required
- (NSArray*)arrayOfHotCitiesInAddressPicker:(TASelectCityViewController*)addressPicker;

@end

@protocol TAddressPickerDelegate <NSObject>

-(void)addressPicker:(TASelectCityViewController*)addressPicker didSelectedCity:(NSString*)city;

- (void)beginSearch:(UISearchBar*)searchBar;

- (void)endSearch:(UISearchBar*)searchBar;

@end
@interface TASelectCityViewController : TABaseViewController<UITableViewDataSource,UITableViewDelegate>
//数据源代理协议
@property (nonatomic, weak) id<TAddressPickerDataSource> dataSource;
//委托代理协议
@property (nonatomic, weak) id<TAddressPickerDelegate> delegate;

- (id)initWithFrame:(CGRect)frame;
@end
