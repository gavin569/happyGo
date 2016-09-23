//
//  TAOwnerCarTypeModel.m
//  TravelAgency
//
//  Created by edianzu on 16/9/14.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAOwnerCarTypeModel.h"

@implementation TAOwnerCarTypeModel
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        self.carType     = dict[@"carType"];
        self.carUnit      = dict[@"carUnit"];
        self.typeId    =[NSString stringWithFormat:@"%@",dict[@"typeId"]];
        
    }
    return self;
}
@end
