//
//  TAJiaoDanModel.m
//  TravelAgency
//
//  Created by edianzu on 16/9/26.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAJiaoDanModel.h"

@implementation TAJiaoDanModel
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        self.price1     = dict[@"price1"];
        self.price2      = dict[@"price2"];
        self.remark      = dict[@"remark"];
        self.routesContent      = dict[@"routesContent"];
        self.routesName      = dict[@"routesName"];
        self.tourismId      = dict[@"tourismId"];
        self.tourismName      = dict[@"tourismName"];
        self.userName      = dict[@"userName"];
        
    }
    return self;
}
@end
