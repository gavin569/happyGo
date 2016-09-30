//
//  TASenceModel.h
//  TravelAgency
//
//  Created by edianzu on 16/9/29.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TASenceModel : NSObject
@property (nonatomic, strong) NSString *attractionsAddress;
@property (nonatomic, strong) NSString *attractionsId;
@property (nonatomic, strong) NSString *attractionsName;
@property (nonatomic, strong) NSString *picture;
@property (nonatomic, strong) NSString *price1;
@property (nonatomic, strong) NSString *price2;
@property (nonatomic, strong) NSString *isSelcted;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
