//
//  TAOwnerCarTypeModel.h
//  TravelAgency
//
//  Created by edianzu on 16/9/14.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TAOwnerCarTypeModel : NSObject
@property (nonatomic, copy) NSString *carType;
@property (nonatomic, copy) NSString *carUnit;
@property (nonatomic, copy) NSString *typeId;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
