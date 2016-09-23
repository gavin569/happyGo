//
//  TALoginAndRegisterViewModel.m
//  TravelAgency
//
//  Created by edianzu on 16/9/9.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TALoginAndRegisterViewModel.h"
#import "TALineListModel.h"
@implementation TALoginAndRegisterViewModel
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _lineList = [[NSMutableArray alloc]init];
        _teamList = [[NSMutableArray alloc]init];
    }
    return self;
}
//请求验证码
- (void)requestCodeWithUserPhoneNumber:(NSString*)phoneNumber
                                  flag:(int)flag
                               success:(StringBlock)success
                               failure:(void (^)())failure {
    [NetworkService requestCodeWithUserPhoneNumber:phoneNumber flag:flag success:^(NSDictionary *result) {
        NSString *yzmStr=result[@"yzm"];
        success(yzmStr);
        
    } failure:^{
       failure(); 
    }];
}
//注册
- (void)registerWithUesrPhoneNumer:(NSString*)phoneNumber
                              role:(int)role
                          passWord:(NSString*)passWord
                           success:(StringBlock)success
                           failure:(void (^)())failure {
    [NetworkService regisgerWithUserPhone:phoneNumber passWord:passWord role:role success:^(NSDictionary *result) {
        NSString *status=[NSString stringWithFormat:@"%@",result[@"status"]];
        success(status);
    
    } failure:^{
        failure();
    }];
}
//登录
/*
 channelId = 111111;
 exist = 0;
 isLeader = 0;
 isPerson = 0;
 roleId = 2;
 userName = KLX425196;
 userPhone = 18300707701;
 userPwd = 3e86429c57a2ee228b84b09ac18ee9f0b4c000e9;
 userStatus = 3;
 */
- (void)loginWithUserName:(NSString*)userName
                 passWord:(NSString*)passWord
                  success:(LoginBlock)success
                  failure:(void (^)())failure {
    [NetworkService loginWithUesrName:userName passWord:passWord aliasId:@"111111" success:^(NSDictionary *result) {
        NSString *status=[NSString stringWithFormat:@"%@",result[@"status"]];
        if ([status isEqualToString:@"0"]) {
             [TACommonTool setUserInfo:result[@"users"]];
//            NSArray *lineListArr = result[@"routesList"];
//            NSArray *teamListArr = result[@"teamroutesList"];
//            for (int i=0; i<lineListArr.count; i++) {
//                TALineListModel *model = [[TALineListModel alloc] initWithDictionary:lineListArr[i]];
//                [self.lineList addObject:model];
//            }
//            for (int i=0; i<teamListArr.count; i++) {
//                TALineListModel *model = [[TALineListModel alloc] initWithDictionary:teamListArr[i]];
//                [self.teamList addObject:model];
//            }
            NSDictionary *userDic=result[@"users"];
            NSString *roleId=[NSString stringWithFormat:@"%@",userDic[@"roleId"]];
            success(status,roleId);
        }else{
           success(status,nil);
        }
    } failure:^{
        failure();
    }];
}
- (void)changePassWordWithUserPhone:(NSString*)phoneNumber
                           passWord:(NSString*)passWord
                            success:(StringBlock)success
                            failure:(void (^)())failure {
    [NetworkService changePassWordWithUserPhone:phoneNumber passWord:passWord success:^(NSDictionary *result) {
        NSString *status=[NSString stringWithFormat:@"%@",result[@"status"]];
        success(status);
    } failure:^{
        failure();
    }];
}
@end
