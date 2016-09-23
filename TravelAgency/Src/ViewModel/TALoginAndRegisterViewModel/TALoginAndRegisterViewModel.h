//
//  TALoginAndRegisterViewModel.h
//  TravelAgency
//
//  Created by edianzu on 16/9/9.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^StringBlock)(NSString*status);
typedef void(^LoginBlock)(NSString*status,NSString*role);
@interface TALoginAndRegisterViewModel : NSObject
@property (nonatomic, strong) NSMutableArray *lineList;
@property (nonatomic,strong) NSMutableArray *teamList;
//请求验证码
- (void)requestCodeWithUserPhoneNumber:(NSString*)phoneNumber
                                  flag:(int)flag
                               success:(StringBlock)success
                               failure:(void (^)())failure;
//注册
- (void)registerWithUesrPhoneNumer:(NSString*)phoneNumber
                             role:(int)role
                         passWord:(NSString*)passWord
                          success:(StringBlock)success
                          failure:(void (^)())failure;
//登录
- (void)loginWithUserName:(NSString*)userName
                 passWord:(NSString*)passWord
                  success:(LoginBlock)success
                  failure:(void (^)())failure;
//修改密码
- (void)changePassWordWithUserPhone:(NSString*)phoneNumber
                           passWord:(NSString*)passWord
                            success:(StringBlock)success
                            failure:(void (^)())failure;
@end
