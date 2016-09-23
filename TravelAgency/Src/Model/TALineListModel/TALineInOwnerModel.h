//
//  TALineInOwnerModel.h
//  TravelAgency
//
//  Created by edianzu on 16/9/14.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TALineInOwnerModel : NSObject
@property (nonatomic, copy) NSString *routesContent;
@property (nonatomic, copy) NSString *routesName;
@property (nonatomic, copy) NSString *tourismName;
@property (nonatomic, copy) NSString *tourismRoutes;
@property (nonatomic, copy) NSString *userName;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
