//
//  TASearchFriendModel.h
//  TravelAgency
//
//  Created by edianzu on 16/9/27.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TASearchFriendModel : NSObject
@property (nonatomic, strong) NSString *exist;
@property (nonatomic, strong) NSString *isLeader;
@property (nonatomic, strong) NSString *isPerson;
@property (nonatomic, strong) NSString *roleId;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userPhone;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
