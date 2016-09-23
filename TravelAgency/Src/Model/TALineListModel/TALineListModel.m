//
//  TALineListModel.m
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TALineListModel.h"

@implementation TALineListModel
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        self.fixedLine     = dict[@"fixedLine"];
        self.lineName      = dict[@"lineName"];
       
    }
    return self;
}
@end
