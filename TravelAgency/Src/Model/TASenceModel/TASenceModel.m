//
//  TASenceModel.m
//  TravelAgency
//
//  Created by edianzu on 16/9/29.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TASenceModel.h"

@implementation TASenceModel
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        self.attractionsAddress     = dict[@"attractionsAddress"];
        self.attractionsName      = dict[@"attractionsName"];
        self.attractionsId      = [NSString stringWithFormat:@"%@",dict[@"attractionsId"]];
        self.picture      = dict[@"picture"];
        self.price1      = dict[@"price1"];
        self.price2      = dict[@"price2"];
        self.isSelcted =@"0";
    }
    return self;
}
@end
