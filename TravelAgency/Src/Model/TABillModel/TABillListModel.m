//
//  TABillListModel.m
//  TravelAgency
//
//  Created by edianzu on 16/9/28.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABillListModel.h"

@implementation TABillListModel
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        self.acceptName     = dict[@"acceptName"];
        self.billNumber      = dict[@"billNumber"];
        self.payMoney      = dict[@"payMoney"];
        self.payName      = dict[@"payName"];
        self.payType      = [NSString stringWithFormat:@"%@",dict[@"payType"]];
        self.showAcceptName      = dict[@"showAcceptName"];
        self.showPayName      = dict[@"showPayName"];
         self.orderDate      = dict[@"orderDate"];
        
    }
    return self;
}
@end
