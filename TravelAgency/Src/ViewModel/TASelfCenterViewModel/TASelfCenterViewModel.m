//
//  TASelfCenterViewModel.m
//  TravelAgency
//
//  Created by edianzu on 16/9/18.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TASelfCenterViewModel.h"
#import "TAFriendModel.h"
#import "TASearchFriendModel.h"
#import "TABillListModel.h"
#import "TAOrderBigModel.h"
#import "TATravelLineModel.h"
#import "TASenceModel.h"
@implementation TASelfCenterViewModel
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        NSDictionary *userDic=[TACommonTool userInfo];
        _userPhone=[NSString stringWithFormat:@"%@",userDic[@"userPhone"]];
        _orderListArr=[[NSMutableArray alloc]init];
       
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
- (void)requestMyFriendsListSuccess:(TAFriendBlock)success
                            failure:(void (^)())failure {
   [NetworkService requestMyFriendsListWithUserPhone:_userPhone success:^(NSDictionary *result) {
      
       NSMutableArray*rowArray;
       NSArray *friendsListArr=result[@"friendsList"];
       NSMutableArray*sectionArr=[[NSMutableArray alloc]init];
       NSMutableArray*arr=[[NSMutableArray alloc]init];
       for (int i=0; i<friendsListArr.count; i++) {
           TAFriendModel*allModel=[[TAFriendModel alloc]initWithDictionary:friendsListArr[i]];
           if (allModel.roleName==nil) {
               [rowArray addObject:allModel];
           }else{
                [sectionArr addObject:allModel.roleName];
               if (rowArray.count>0) {
                   [arr addObject:rowArray];
               }
               rowArray=[[NSMutableArray alloc]init];
               
           }
       }
       if (friendsListArr.count==0) {
           rowArray=[[NSMutableArray alloc]init];
       }
      [arr addObject:rowArray];
       success(sectionArr,arr);
   } failure:^{
       failure();
   }];
}
//搜素好友列表
- (void)searchFirendWithFriendsMessges:(NSString*)friendsMessges
                               success:(TASelfCenterBlock)success
                               failure:(void (^)())failure {
    [NetworkService searchFiendsWithUserName:[friendsMessges base64EncodedString]  userPhone:_userPhone success:^(NSDictionary *result) {
        NSArray *arr=result[@"friendList"];
        NSMutableArray *searchFriendListArr=[[NSMutableArray alloc]init];
        for (int i=0; i<arr.count; i++) {
            TASearchFriendModel*model=[[TASearchFriendModel alloc]initWithDictionary:arr[i]];
            [searchFriendListArr addObject:model];
        }
        success(searchFriendListArr);
    } failure:^{
        failure();
    }];
}
//添加好友
- (void)addFriendWithFriendMessageWithDictionary:(NSDictionary*)dic
                                         success:(AddFriendBlock)success
                                         failure:(void (^)())failure{
    [NetworkService addFriendsWithFriendMessageDictionary:dic success:^(NSDictionary *result) {
        NSString *status=[NSString stringWithFormat:@"%@",result[@"status"]];
        success(status);
    } failure:^{
        
    }];
}
//我的账单
- (void)requestMyBillListSuccess:(TASelfCenterBlock)success
                         failure:(void (^)())failure {
   [NetworkService requestMyBillListWithUserPhone:_userPhone Success:^(NSDictionary *result) {
       NSArray *billListArr=result[@"billList"];
       NSMutableArray *billArr=[[NSMutableArray alloc]init];
       for (int i=0; i<billListArr.count; i++) {
           TABillListModel *model=[[TABillListModel alloc]initWithDictionary:billListArr[i]];
           [billArr addObject:model];
       }
       success(billArr);
   } failure:^{
       
   }];
}
//查询旅行社路线
- (void)requestMyLineListSuccess:(TASelfCenterBlock)success
                         failure:(void (^)())failure{
[NetworkService requestTravelLinesListWithUserPhone:_userPhone Success:^(NSDictionary *result) {
    NSArray *arr=result[@"routesList"];
    NSMutableArray *billArr=[[NSMutableArray alloc]init];
    for (int i=0; i<arr.count; i++) {
        TATravelLineModel *model=[[TATravelLineModel alloc]initWithDictionary:arr[i]];
        [billArr addObject:model];
    }
    success(billArr);
} failure:^{
    
}];
}
//旅行社订单
- (void)requestTravelOrderListsWithPage:(int)page
                                 status:(int)status{

    [NetworkService requestTraveOrdersListWithUserPhone:_userPhone page:page orderStatus:status Success:^(NSDictionary *result) {
        _pageCount = 1+[result[@"total"] intValue]/10;
        NSMutableArray *marr = [[NSMutableArray alloc]init];
        NSArray *OrderInfoListDataArr=result[@"OrderInfoListData"];
        for (int i=0; i<OrderInfoListDataArr.count; i++) {
            TAOrderBigModel *model=[[TAOrderBigModel alloc]initWithDictionary:OrderInfoListDataArr[i]];
             [marr addObject:model];
        }
        if (page == 1)
        {
            [self.orderListArr removeAllObjects];
            self.orderListArr=marr;
        }else{
            [self.orderListArr addObjectsFromArray:marr];
        }
        if (_refreshCompletion)
        {
            _refreshCompletion(page >= _pageCount);
        }

    } failure:^{
    
    }];
}
- (void)refreshTravelOrderListWithStatus:(int)status{
    _page = 1;
    [self requestTravelOrderListsWithPage:_page status:status];
}

- (void)loadMoreTravelOrderListWithStatus:(int)status{
    if (_page < _pageCount)
    {
        _page += 1;
        [self requestTravelOrderListsWithPage:_page status:status];
    }
    else
    {
        _refreshCompletion(YES);
    }
}
//查询所有景点
- (void)requestAllSencesListSuccess:(TASelfCenterBlock)success
                            failure:(void (^)())failure {
    [NetworkService requestAllSencesSuccess:^(NSDictionary *result) {
        NSMutableArray *scnceArr=[[NSMutableArray alloc]init];
        NSArray *array=result[@"tbAttractionsList"];
        for (int i=0; i<array.count; i++) {
            TASenceModel *model=[[TASenceModel alloc]initWithDictionary:array[i]];
            [scnceArr addObject:model];
        }
        success(scnceArr);
    } failure:^{
        
    }];
}
@end
