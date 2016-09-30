//
//  TAOrderSmallModel.h
//  TravelAgency
//
//  Created by edianzu on 16/9/29.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TAOrderSmallModel : NSObject
@property (nonatomic, strong) NSString *carName;
@property (nonatomic, strong) NSString *carPhone;
@property (nonatomic, strong) NSString *carStatus;
@property (nonatomic, strong) NSString *guideName;
@property (nonatomic, strong) NSString *guidePhone;
@property (nonatomic, strong) NSString *guideStatus;
@property (nonatomic, strong) NSString *payMoneyCar;
@property (nonatomic, strong) NSString *payMoneyGuide;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
