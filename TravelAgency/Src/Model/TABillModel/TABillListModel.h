//
//  TABillListModel.h
//  TravelAgency
//
//  Created by edianzu on 16/9/28.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TABillListModel : NSObject
@property (nonatomic, strong) NSString *acceptName;
@property (nonatomic, strong) NSString *billNumber;
@property (nonatomic, strong) NSString *payMoney;
@property (nonatomic, strong) NSString *payName;
@property (nonatomic, strong) NSString *payType;
@property (nonatomic, strong) NSString *showPayName;
@property (nonatomic, strong) NSString *showAcceptName;
@property (nonatomic, strong) NSString *orderDate;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
