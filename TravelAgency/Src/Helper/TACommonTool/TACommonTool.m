//
//  TACommonTool.m
//  TravelAgency
//
//  Created by edianzu on 16/9/6.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TACommonTool.h"
#import "TALoginViewController.h"
#import "TATravelViewController.h"
#import "TAJiaoDanViewController.h"
#import "TADriverViewController.h"
#import "TATouristViewController.h"
#import "TAOwnerViewController.h"
NSString *const KUSER_INFO_KEY = @"KUSER_INFO_KEY";
@implementation TACommonTool
//去登录界面
+ (void)gotoLoginVc {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"TALoginAndRegisterStoryboard" bundle:nil];
    TALoginViewController *secondViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"TALoginViewController"];
    UINavigationController *LoginNav = [[UINavigationController alloc] initWithRootViewController:secondViewController];
    
    window.rootViewController = LoginNav;
}
//去交单界面
+ (void)gotoJiaoDanVc {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    TAJiaoDanViewController *mainVc = [[TAJiaoDanViewController alloc] init];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainVc];
    window.rootViewController = mainNav;
}
//去旅行社界面
+ (void)gotoTraveHotelVc {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    TATravelViewController *mainVc = [[TATravelViewController alloc] init];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainVc];
    window.rootViewController = mainNav;
}
//司机界面
+ (void)gotoTraveDriverVc {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    TADriverViewController *mainVc = [[TADriverViewController alloc] init];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainVc];
    window.rootViewController = mainNav;
}
//导游界面
+ (void)gotoTraveTouristVc {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    TATouristViewController *mainVc = [[TATouristViewController alloc] init];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainVc];
    window.rootViewController = mainNav;
}
//车主界面
+ (void)gotoOwnersVc {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    TAOwnerViewController *mainVc = [[TAOwnerViewController alloc] init];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainVc];
    window.rootViewController = mainNav;
}
//判断手机号码是否存在
+ (BOOL)valiMobile:(NSString *)mobile{
    if (mobile.length < 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
    return NO;
}
+ (void)setUserInfo:(NSMutableDictionary *)dict
{
    [USER_DEFAULTS setObject:dict forKey:KUSER_INFO_KEY];
    [USER_DEFAULTS synchronize];
    
}

+ (NSMutableDictionary *)userInfo
{
    return [USER_DEFAULTS objectForKey:KUSER_INFO_KEY];
}

+ (void)removeUserInfo
{
    [USER_DEFAULTS removeObjectForKey:KUSER_INFO_KEY];
}
//事件排序
+ (NSArray*)rankInArrWithArrary:(NSArray*)arr {
    arr = (NSMutableArray *)[arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy.MM.dd"];
        if (obj1 == [NSNull null]) {
            obj1 = @"0000.00.00";
        }
        if (obj2 == [NSNull null]) {
            obj2 = @"0000.00.00";
        }
        NSDate *date1 = [formatter dateFromString:obj1];
        NSDate *date2 = [formatter dateFromString:obj2];
        NSComparisonResult result = [date1 compare:date2];
        return result == NSOrderedAscending;
    }];
    return arr;
}
+ (NSString*)dictionaryToJson:(NSDictionary *)dic{
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString{
    if (jsonString == nil) {
        
        return nil;
        
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    
    if(err) {
        
        
        return nil;
        
    }
    
    return dic;
    
}

@end
