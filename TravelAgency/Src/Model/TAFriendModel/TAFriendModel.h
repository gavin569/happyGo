//
//  TAFriendModel.h
//  TravelAgency
//
//  Created by edianzu on 16/9/27.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TAFriendModel : NSObject
@property (nonatomic, strong) NSString *roleName;
@property (nonatomic, strong) NSString *friendName;
@property (nonatomic, strong) NSString *refrenceUser;
@property (nonatomic, strong) NSString *roleId;
@property (nonatomic, strong) NSString *userPhone;
@property (nonatomic, strong) NSString *status;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
