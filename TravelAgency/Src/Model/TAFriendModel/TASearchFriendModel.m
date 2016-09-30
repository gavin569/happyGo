//
//  TASearchFriendModel.m
//  TravelAgency
//
//  Created by edianzu on 16/9/27.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TASearchFriendModel.h"

@implementation TASearchFriendModel
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        self.exist     = [NSString stringWithFormat:@"%@",dict[@"exist"]];
        self.isLeader      = [NSString stringWithFormat:@"%@",dict[@"isLeader"]];
        self.isPerson      = [NSString stringWithFormat:@"%@",dict[@"isPerson"]];
        self.roleId      = [NSString stringWithFormat:@"%@",dict[@"roleId"]];
        self.userName      = dict[@"userName"];
        self.userPhone      = dict[@"userPhone"];
        
    }
    return self;
}
@end
