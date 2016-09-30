//
//  TAFriendModel.m
//  TravelAgency
//
//  Created by edianzu on 16/9/27.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAFriendModel.h"

@implementation TAFriendModel
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        self.roleName     = dict[@"roleName"];
        self.friendName      = dict[@"friendName"];
        self.refrenceUser      = dict[@"refrenceUser"];
        self.roleId      = [NSString stringWithFormat:@"%@",dict[@"roleId"]];
        self.status      = [NSString stringWithFormat:@"%@",dict[@"status"]];
        self.userPhone      = dict[@"userPhone"];
        
    }
    return self;
}
@end
