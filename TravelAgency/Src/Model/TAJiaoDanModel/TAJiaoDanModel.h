//
//  TAJiaoDanModel.h
//  TravelAgency
//
//  Created by edianzu on 16/9/26.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TAJiaoDanModel : NSObject
@property (nonatomic, strong) NSString *price1;
@property (nonatomic, strong) NSString *price2;
@property (nonatomic, strong) NSString *remark;
@property (nonatomic, strong) NSString *routesContent;
@property (nonatomic, strong) NSString *routesName;
@property (nonatomic, strong) NSString *tourismId;
@property (nonatomic, strong) NSString *tourismName;
@property (nonatomic, strong) NSString *userName;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
