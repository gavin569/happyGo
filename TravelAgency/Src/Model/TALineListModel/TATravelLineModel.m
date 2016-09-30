//
//  TATravelLineModel.m
//  TravelAgency
//
//  Created by edianzu on 16/9/29.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TATravelLineModel.h"

@implementation TATravelLineModel
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        self.price1      = [NSString stringWithFormat:@"%@",dict[@"price1"]];
        self.price2      = [NSString stringWithFormat:@"%@",dict[@"price2"]];
        self.routesContent     = dict[@"routesContent"];
        self.routesName      = dict[@"routesName"];
        self.tourismName      = dict[@"tourismName"];
        self.tourismRoutes      = dict[@"tourismRoutes"];
        self.userName      = dict[@"userName"];
        self.userPhone      = dict[@"userPhone"];
        

        
    }
    return self;
}
@end
