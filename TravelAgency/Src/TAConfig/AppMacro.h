//
//  AppMacro.h
//  WJ
//
//  Created by edianzu on 16/7/4.
//  Copyright © 2016年 edianzu. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h
/*!第三方基础key*/
//基础url
extern NSString *const ROOT_URL;
/*!请求验证码接口*/
extern NSString *const GET_CODENUM;
/*!登陆接口*/
extern NSString *const LOGIN;
/*!注册接口*/
extern NSString *const REGISER;
/*!修改密码接口*/
extern NSString *const RESET_PASSWORD;
/*!获取车主的所有旅游路线*/
extern NSString *const REQYEST_ALLROUTES;
/*!获取车辆类型*/
extern NSString *const REQUEST_ALLCARTYPE;
/*!获取系统消息*/
extern NSString *const REQUEST_SYSTEMMESSAGES;
/*!获取好友列表*/
extern NSString *const REQUEST_FRIENDSLIST;
/*!搜索好友列表*/
extern NSString *const SEARCH_FRIENDSLIST;
//颜色
#define COLOR_ffffff [UIColor whiteColor]
#define COLOR_999999 HEXCOLOR(0x999999)
#define COLOR_0073be HEXCOLOR(0x0073be)
#define COLOR_f1f1f1 HEXCOLOR(0xf1f1f1)
#define COLOR_333333 HEXCOLOR(0x333333)
#define COLOR_d1d1d1 HEXCOLOR(0xd1d1d1)
#define COLOR_f04c42 HEXCOLOR(0xf04c42)
#define COLOR_44A700_50 [COLOR_44A700 colorWithAlphaComponent:0.5f]
#define BACKGROUND_COLOR [UIColor colorWithWhite:0 alpha:0.6]
#define ALERT_BACKGROUND_COLOR [UIColor colorWithRed:242/255.f green:242/255.f blue:242/255.f alpha:1]
#define ALERT_LINE_COLOR [UIColor colorWithRed:209/255.f green:209/255.f blue:209/255.f alpha:1]

#endif /* AppMacro_h */
