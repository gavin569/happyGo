//
//  TALoadingView.h
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TALoadingView : UIView
{
    ///指示器
    UIActivityIndicatorView *indicatorView;
    ///包含指示器和文字的view
    UIView *conerView;
}
@property (nonatomic) BOOL isLikeSynchro;
///显示加载框
- (void)show;

///关闭加载框
- (void)close;

///获取LoadingView单例,isLikeSynchro  Yes:类似同步，通过遮盖整个窗体实现 No:异步
+ (TALoadingView *)shareLoadingViewWithTitle:(NSString*)title;
@end
