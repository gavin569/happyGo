//
//  AppMacro.m
//  WJ
//
//  Created by edianzu on 16/7/4.
//  Copyright © 2016年 edianzu. All rights reserved.
//
#import "AppMacro.h"

/*!第三方基础key*/

//基础url
NSString *const ROOT_URL = @"http://192.168.0.118:8080";
/*!请求验证码接口*/
NSString *const GET_CODENUM = @"/tourism/app/register/sendMsg.htm";
/*!登陆接口*/
NSString *const LOGIN = @"/tourism/app/register/userLogin.htm";
/*!注册接口*/
NSString *const REGISER = @"/tourism/app/register/register.htm";
/*!修改密码接口*/
NSString *const RESET_PASSWORD=@"/tourism/app/register/resetPwd.htm";
/*!获取车主的所有旅游路线*/
NSString *const REQYEST_ALLROUTES= @"/tourism/app/register/getAllRoutes.htm";
/*!获取车辆类型*/
NSString *const REQUEST_ALLCARTYPE=@"/tourism/app/common/getCarTypeList.htm";
/*!获取系统消息*/
NSString *const REQUEST_SYSTEMMESSAGES=@"/tourism/app/tourism/getMessageListById.htm";
/*!获取好友列表*/
NSString *const REQUEST_FRIENDSLIST= @"/tourism/app/common/getFriendsList.htm";
/*!搜索好友列表*/
NSString *const SEARCH_FRIENDSLIST =@"/tourism/app/common/findFriendById.htm";
/*!一日游路线*/
NSString *const REQUEST_ONEDAY_LINE=@"/tourism/app/tourism/getFixedLineList.htm";
/*!团队游路线*/
NSString *const REQUEST_ALLTEM_LINE=@"/tourism/app/tourism/getToursimRoutesList.htm String userPhone";
/*!交单路线详情*/
NSString *const REQUEST_ROUTES= @"/tourism/app/tourism/serachRoutes.htm";
/*!交单*/
NSString *const SUBMIT_ORDER=@"/tourism/app/tourism/addOrder.htm";
/*!添加好友*/
NSString *const ADD_MYFRIEND=@"/tourism/app/common/addFriends.htm";
/*!我的账单*/
NSString *const REQUEST_MYBILL=@"/tourism/app/bill/getBillList.htm";
/*!查询旅行社线路*/
NSString *const QUERY_TRAVELLINELIST=@"/tourism/app/common/getTourismRoutesList.htm";
/*!查询旅行社订单*/
NSString *const QUERY_TRAVELORDERLIST=@"/tourism/app/order/getOrderListTravel.htm";
/*!查询旅行社景点*/
NSString *const QUERY_TRAVELALLSCENE=@"/tourism/app/common/getAttractionsList.htm";