//
//  TASelfCenterViewModel.h
//  TravelAgency
//
//  Created by edianzu on 16/9/18.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^TASelfCenterBlock)(NSArray*messageArr);
typedef void(^TAFriendBlock)(NSArray*sectionArr,NSArray*rowArr);
typedef void(^AddFriendBlock)(NSString*isSuccess);
@interface TASelfCenterViewModel : NSObject{
    int _page;
    int _pageCount;
}
@property (nonatomic, strong) NSString *userPhone;
@property (nonatomic,strong) NSMutableArray *orderListArr;
@property (nonatomic, copy) void (^refreshCompletion)(BOOL noMore);
@property (nonatomic, copy) void (^activeFailure)();
//请求系统消息
- (void)requestSystemMessgesSuccess:(TASelfCenterBlock)success
                               failure:(void (^)())failure;
//请求好友列表
- (void)requestMyFriendsListSuccess:(TAFriendBlock)success
                            failure:(void (^)())failure;
//搜素好友列表
- (void)searchFirendWithFriendsMessges:(NSString*)friendsMessges
                         success:(TASelfCenterBlock)success
                         failure:(void (^)())failure;
//添加好友
- (void)addFriendWithFriendMessageWithDictionary:(NSDictionary*)dic
                                         success:(AddFriendBlock)success
                                         failure:(void (^)())failure;
//我的账单
- (void)requestMyBillListSuccess:(TASelfCenterBlock)success
                         failure:(void (^)())failure;

//查询我的路线
- (void)requestMyLineListSuccess:(TASelfCenterBlock)success
                         failure:(void (^)())failure;
//旅行社订单
- (void)refreshTravelOrderListWithStatus:(int)status;
- (void)loadMoreTravelOrderListWithStatus:(int)status;
//查询所有景点
- (void)requestAllSencesListSuccess:(TASelfCenterBlock)success
                         failure:(void (^)())failure;
@end
