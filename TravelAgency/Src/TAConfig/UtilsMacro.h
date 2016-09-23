//
//  UtilsMacro.h
//  WJ
//
//  Created by edianzu on 16/7/4.
//  Copyright © 2016年 edianzu. All rights reserved.
//
#ifndef UtilsMacro_h
#define UtilsMacro_h


#define SCREEN_BOUNDS [[UIScreen mainScreen] bounds]
#define SCREEN_SCALE ([[UIScreen mainScreen] scale])
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define CURRENT_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define iOS8 (CURRENT_VERSION >= 8.0)

#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define SYS_F(s) [UIFont systemFontOfSize:s]
#define SYS_B_F(s) [UIFont boldSystemFontOfSize:s]

#define ROOT_VC [[[[UIApplication sharedApplication] delegate] window] rootViewController]
#define USER_DEFAULTS [NSUserDefaults standardUserDefaults]

#define IMAGE_WITH_COLOR(color) \
({\
CGRect rect = CGRectMake(0, 0, 1, 1);\
UIGraphicsBeginImageContext(rect.size);\
CGContextRef context = UIGraphicsGetCurrentContext();\
CGContextSetFillColorWithColor(context, color.CGColor);\
CGContextFillRect(context, rect);\
UIImage *image = UIGraphicsGetImageFromCurrentImageContext();\
UIGraphicsEndImageContext();\
image;\
})

#define IPONE_5 (SCREEN_WIDTH == 320.f && SCREEN_HEIGHT == 568.f)
#define IPONE_6P (SCREEN_WIDTH == 414.f && SCREEN_HEIGHT == 736.f)
#define EPSINON 0.000001f
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define BUTTON_WIDTH (ScreenWidth - 90) / 3
#define BUTTON_HEIGHT 36

#define UIColorFromRGBA(r, g, b , a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define BG_CELL UIColorFromRGBA(250, 250, 250, 1.0)

#define currentCity (@"currentCity")

#endif
