//
//  NetworkService.m
//  BR_SE
//
//  Created by edianzu on 16/7/21.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "NetworkService.h"

@implementation NetworkService
+ (AFHTTPSessionManager *)sessionManager {
    static AFHTTPSessionManager *sessionManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:ROOT_URL]];
//  如果提交数据是JSON的,需要将请求格式设置为AFJSONRequestSerializer,如果不是JSON,可以不用设置
                sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
                sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",nil];
    });
    return sessionManager;
}
+ (void)getRequestWithURL:(NSString *)url
               parameters:(NSDictionary *)parameters
                  success:(DictionaryBlock)success
                  failure:(void (^)())failure{
    
    url = [[ROOT_URL stringByAppendingString:url] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [[self sessionManager] GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure();
    }];
}
+ (void)postRequestWithURL:(NSString *)url
                parameters:(NSDictionary *)parameters
                   success:(DictionaryBlock)success
                   failure:(void (^)())failure{
    
    url = [[ROOT_URL stringByAppendingString:url] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [[self sessionManager] POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure();
    }];
}
//请求验证码
+ (void)requestCodeWithUserPhoneNumber:(NSString*)PhoneNumber
                                  flag:(int)flag
                               success:(DictionaryBlock)success
                               failure:(void (^)())failure {
    NSString*url=[NSString stringWithFormat:@"%@?phone=%@&flag=%d",GET_CODENUM,PhoneNumber,flag];
    [self getRequestWithURL:url parameters:nil success:success failure:failure];

}
//注册
+ (void)regisgerWithUserPhone:(NSString*)phone
                     passWord:(NSString*)password
                         role:(int)role
                      success:(DictionaryBlock)success
                      failure:(void (^)())failure {
    NSString*url=[NSString stringWithFormat:@"%@?userPhone=%@&password=%@&roleId=%d",REGISER,phone,password,role];
    [self getRequestWithURL:url parameters:nil success:success failure:failure];
}
//登录
+ (void)loginWithUesrName:(NSString*)userName
                 passWord:(NSString*)passWord
                  aliasId:(NSString*)aliasId
                  success:(DictionaryBlock)success
                  failure:(void (^)())failure {
    NSString*url=[NSString stringWithFormat:@"%@?userPhone=%@&userPwd=%@&aliasId=%@",LOGIN,userName,passWord,aliasId];
    [self getRequestWithURL:url parameters:nil success:success failure:failure];
}
+ (void)changePassWordWithUserPhone:(NSString*)userPhone
                           passWord:(NSString*)passWord
                            success:(DictionaryBlock)success
                            failure:(void (^)())failure{
    NSString*url=[NSString stringWithFormat:@"%@?userPhone=%@&password=%@",RESET_PASSWORD,userPhone,passWord];
    [self getRequestWithURL:url parameters:nil success:success failure:failure];
}
//请求车主的所有路线
+ (void)requestAllRoutesInOwnerSuccess:(DictionaryBlock)success
                               failure:(void (^)())failure {
    NSString*url=[NSString stringWithFormat:@"%@",REQYEST_ALLROUTES];
    [self getRequestWithURL:url parameters:nil success:success failure:failure];
}
//请求所有车的类型
+ (void)requestAllCarTypesInOwnerSuccess:(DictionaryBlock)success
                                 failure:(void (^)())failure{
    NSString*url=[NSString stringWithFormat:@"%@",REQUEST_ALLCARTYPE];
    [self getRequestWithURL:url parameters:nil success:success failure:failure];
}
//请求系统消息
+ (void)requestSystemMessagesWithUserPhone:(NSString*)userPhone
                                   success:(DictionaryBlock)success
                                   failure:(void (^)())failure{
    NSString*url=[NSString stringWithFormat:@"%@?userPhone=%@",REQUEST_SYSTEMMESSAGES,userPhone];
    [self getRequestWithURL:url parameters:nil success:success failure:failure];
}
//请求好友列表
+ (void)requestMyFriendsListWithUserPhone:(NSString*)userPhone
                                  success:(DictionaryBlock)success
                                  failure:(void (^)())failure {
    NSString*url=[NSString stringWithFormat:@"%@?userPhone=%@",REQUEST_FRIENDSLIST,userPhone];
    [self getRequestWithURL:url parameters:nil success:success failure:failure];
}
//搜索好友列表
+ (void)searchFiendsWithUserName:(NSString*)userName
                       userPhone:(NSString*)userPhone
                         success:(DictionaryBlock)success
                         failure:(void (^)())failure {
    NSString*url=[NSString stringWithFormat:@"%@?userPhone=%@&userName=%@",SEARCH_FRIENDSLIST,userPhone,userName];
    [self getRequestWithURL:url parameters:nil success:success failure:failure];
}
@end
