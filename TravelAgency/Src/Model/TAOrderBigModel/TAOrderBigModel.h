//
//  TAOrderBigModel.h
//  TravelAgency
//
//  Created by edianzu on 16/9/29.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TAOrderBigModel : NSObject
@property (nonatomic, strong) NSString *orderDate;
@property (nonatomic, strong) NSString *orderId;
@property (nonatomic, strong) NSString *orderInfoId;
@property (nonatomic, strong) NSString *orderStatus;
@property (nonatomic, strong) NSString *payStatus;
@property (nonatomic, strong) NSString *routesId;
@property (nonatomic, strong) NSString *tourismNum;
@property (nonatomic, strong) NSString *touristDate;
@property (nonatomic, strong) NSString *toursimPhone;
@property (nonatomic, strong) NSArray *billList;
@property (nonatomic, strong) NSMutableArray *smallArr;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
