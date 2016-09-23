//
//  TAOwnerViewModel.h
//  TravelAgency
//
//  Created by edianzu on 16/9/14.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^SuccessBlockA)(NSArray*resultArr);
@interface TAOwnerViewModel : NSObject
//请求车主的所有路线
- (void)requestAllCarTypesInOwnerSuccess:(SuccessBlockA)success
                               failure:(void (^)())failure;
@end
