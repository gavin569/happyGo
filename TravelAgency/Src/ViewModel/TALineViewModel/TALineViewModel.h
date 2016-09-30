//
//  TALineViewModel.h
//  TravelAgency
//
//  Created by edianzu on 16/9/14.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^SuccessBlock)(NSArray*travelArray,NSArray*lineListArray);
@interface TALineViewModel : NSObject
@property (nonatomic, strong) NSArray *travelArr;
@property (nonatomic,strong) NSMutableArray *lineListArr;
//请求车主的所有路线
- (void)requestAllRoutesInOwnerSuccess:(SuccessBlock)success
                               failure:(void (^)())failure;
//一日游路线
- (void)requestOneDayLineSuccess:(SuccessBlock)success
                         failure:(void (^)())failure;
//团队游路线
- (void)requestAllTeamLineSuccess:(SuccessBlock)success
                         failure:(void (^)())failure;
@end
