//
//  TASelfCenterViewModel.m
//  TravelAgency
//
//  Created by edianzu on 16/9/18.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TASelfCenterViewModel.h"

@implementation TASelfCenterViewModel
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        NSDictionary *userDic=[TACommonTool userInfo];
        _userPhone=[NSString stringWithFormat:@"%@",userDic[@"userPhone"]];
    }
    return self;
}
//请求系统消息
- (void)requestSystemMessgesSuccess:(TASelfCenterBlock)success
                            failure:(void (^)())failure {

    [NetworkService requestSystemMessagesWithUserPhone:_userPhone success:^(NSDictionary *result) {
        NSArray *systemMessgeArr=result[@"messageList"];
        NSLog(@"----%@",systemMessgeArr);
    } failure:^{
        failure();
    }];
}
//请求好友列表
- (void)requestMyFriendsListSuccess:(TASelfCenterBlock)success
                            failure:(void (^)())failure {
   [NetworkService requestMyFriendsListWithUserPhone:_userPhone success:^(NSDictionary *result) {
       NSArray *friendsListArr=result[@"friendsList"];
       NSLog(@"----%@",friendsListArr);
   } failure:^{
       failure();
   }];
}
//搜素好友列表
- (void)searchFirendWithFriendsMessges:(NSString*)friendsMessges
                               success:(TASelfCenterBlock)success
                               failure:(void (^)())failure {
    [NetworkService searchFiendsWithUserName:friendsMessges userPhone:_userPhone success:^(NSDictionary *result) {
        NSLog(@"-----%@",result);
    } failure:^{
        failure();
    }];
}
@end
