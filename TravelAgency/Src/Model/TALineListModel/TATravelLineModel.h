//
//  TATravelLineModel.h
//  TravelAgency
//
//  Created by edianzu on 16/9/29.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TATravelLineModel : NSObject
@property (nonatomic, copy) NSString *price1;
@property (nonatomic, copy) NSString *price2;
@property (nonatomic, copy) NSString *routesContent;
@property (nonatomic, copy) NSString *routesName;
@property (nonatomic, copy) NSString *tourismName;
@property (nonatomic, copy) NSString *tourismRoutes;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userPhone;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
