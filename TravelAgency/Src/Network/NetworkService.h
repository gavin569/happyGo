//
//  NetworkService.h
//  BR_SE
//
//  Created by edianzu on 16/7/21.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DictionaryBlock)(NSDictionary *result);
@interface NetworkService : NSObject
+ (void)getRequestWithURL:(NSString *)url
               parameters:(NSDictionary *)parameters
                  success:(DictionaryBlock)success
                  failure:(void (^)())failure;

+ (void)postRequestWithURL:(NSString *)url
                parameters:(NSDictionary *)parameters
                   success:(DictionaryBlock)success
                   failure:(void (^)())failure;
//请求验证码
+ (void)requestCodeWithUserPhoneNumber:(NSString*)PhoneNumber
                                  flag:(int)flag
                               success:(DictionaryBlock)success
                               failure:(void (^)())failure;
//注册
+ (void)regisgerWithUserPhone:(NSString*)phone
                     passWord:(NSString*)password
                         role:(int)role
                      success:(DictionaryBlock)success
                      failure:(void (^)())failure;
//登录
+ (void)loginWithUesrName:(NSString*)userName
                 passWord:(NSString*)passWord
                  aliasId:(NSString*)aliasId
                  success:(DictionaryBlock)success
                  failure:(void (^)())failure;

//修改密码
+ (void)changePassWordWithUserPhone:(NSString*)userPhone
                           passWord:(NSString*)passWord
                            success:(DictionaryBlock)success
                            failure:(void (^)())failure;
//请求车主的所有路线
+ (void)requestAllRoutesInOwnerSuccess:(DictionaryBlock)success
                               failure:(void (^)())failure;

//请求所有车的类型
+ (void)requestAllCarTypesInOwnerSuccess:(DictionaryBlock)success
                               failure:(void (^)())failure;
//请求系统消息
+ (void)requestSystemMessagesWithUserPhone:(NSString*)userPhone
                                   success:(DictionaryBlock)success
                                   failure:(void (^)())failure;
//请求好友列表
+ (void)requestMyFriendsListWithUserPhone:(NSString*)userPhone
                                   success:(DictionaryBlock)success
                                   failure:(void (^)())failure;
//搜索好友列表
+ (void)searchFiendsWithUserName:(NSString*)userName
                       userPhone:(NSString*)userPhone
                         success:(DictionaryBlock)success
                         failure:(void (^)())failure;
//查询一日游路线
+ (void)requestOneDayLinesuccess:(DictionaryBlock)success
                         failure:(void (^)())failure;
//查询团队游路线
+ (void)requestAllTeamLinesuccess:(DictionaryBlock)success
                         failure:(void (^)())failure;
//请求交单路线信息
+ (void)serachRoutesInJiaoDanWithFixedLine:(int)fixedLine
                                   success:(DictionaryBlock)success
                                   failure:(void (^)())failure;
//交单提交订单
+ (void)submitOrderWithDictionary:(NSDictionary*)dic
                          success:(DictionaryBlock)success
                          failure:(void (^)())failure;


//添加好友
+ (void)addFriendsWithFriendMessageDictionary:(NSDictionary*)dic
                                      success:(DictionaryBlock)success
                                      failure:(void (^)())failure;
//请求我的账单
+ (void)requestMyBillListWithUserPhone:(NSString*)userPhone
                               Success:(DictionaryBlock)success
                          failure:(void (^)())failure;
//请求旅行社的路线
+ (void)requestTravelLinesListWithUserPhone:(NSString*)userPhone
                               Success:(DictionaryBlock)success
                               failure:(void (^)())failure;
//请求旅行社的订单
+ (void)requestTraveOrdersListWithUserPhone:(NSString*)userPhone
                                       page:(int)pageNo
                                orderStatus:(int)orderStatus
                                    Success:(DictionaryBlock)success
                                    failure:(void (^)())failure;
//查询所有景点
+ (void)requestAllSencesSuccess:(DictionaryBlock)success
                          failure:(void (^)())failure;

@end
