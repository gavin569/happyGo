//
//  TALineListModel.h
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TALineListModel : NSObject
@property (nonatomic, copy) NSString *fixedLine;
@property (nonatomic, copy) NSString *lineName;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
