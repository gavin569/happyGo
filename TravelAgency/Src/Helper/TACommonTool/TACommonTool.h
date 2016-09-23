//
//  TACommonTool.h
//  TravelAgency
//
//  Created by edianzu on 16/9/6.
//  Copyright © 2016年 Gavin. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TACommonTool : NSObject
//去登陆界面
+ (void)gotoLoginVc;
//去交单界面
+ (void)gotoJiaoDanVc;
//去旅行社界面
+ (void)gotoTraveHotelVc;
//司机界面
+ (void)gotoTraveDriverVc;
//导游界面
+ (void)gotoTraveTouristVc;
//车主界面
+ (void)gotoOwnersVc;
//判断手机号是否存在
+ (BOOL)valiMobile:(NSString *)mobile;
//判断用户是否存在
+ (void)setUserInfo:(NSMutableDictionary *)dict;
+ (NSMutableDictionary *)userInfo;
+ (void)removeUserInfo;
+ (NSArray*)rankInArrWithArrary:(NSArray*)arr;
@end
