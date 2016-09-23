//
//  TAAddressPickerViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/18.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"
typedef void(^AddressBlock)(NSString * cityName);
@interface TAAddressPickerViewController : TABaseViewController
@property (nonatomic, copy) AddressBlock AddressBlock;
@end
