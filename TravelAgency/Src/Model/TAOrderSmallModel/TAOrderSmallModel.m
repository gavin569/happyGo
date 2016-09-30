//
//  TAOrderSmallModel.m
//  TravelAgency
//
//  Created by edianzu on 16/9/29.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAOrderSmallModel.h"

@implementation TAOrderSmallModel
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        self.carName     = dict[@"carName"];
        self.carPhone      = dict[@"carPhone"];
        self.carStatus      = [NSString stringWithFormat:@"%@",dict[@"carStatus"]];
         self.guideName      = dict[@"guideName"];
        self.guidePhone      = dict[@"guidePhone"];
        self.guideStatus      = [NSString stringWithFormat:@"%@",dict[@"guideStatus"]];
        self.payMoneyGuide      = dict[@"payMoneyGuide"];
        self.payMoneyCar      = dict[@"payMoneyCar"];
        
    }
    return self;
}
@end
