//
//  TASelfCenterViewModel.h
//  TravelAgency
//
//  Created by edianzu on 16/9/18.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^TASelfCenterBlock)(NSArray*messageArr);
@interface TASelfCenterViewModel : NSObject
@property (nonatomic, strong) NSString *userPhone;
//请求系统消息
- (void)requestSystemMessgesSuccess:(TASelfCenterBlock)success
                               failure:(void (^)())failure;
//请求好友列表
- (void)requestMyFriendsListSuccess:(TASelfCenterBlock)success
                            failure:(void (^)())failure;
//搜素好友列表
- (void)searchFirendWithFriendsMessges:(NSString*)friendsMessges
                         success:(TASelfCenterBlock)success
                         failure:(void (^)())failure;



@end
