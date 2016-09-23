//
//  TALineInOwnerModel.m
//  TravelAgency
//
//  Created by edianzu on 16/9/14.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TALineInOwnerModel.h"

@implementation TALineInOwnerModel
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        self.routesContent     = dict[@"routesContent"];
        self.routesName      = dict[@"routesName"];
        self.tourismName      = dict[@"tourismName"];
        self.tourismRoutes      = dict[@"tourismRoutes"];
        self.userName      = dict[@"userName"];
        
    }
    return self;
}
@end
