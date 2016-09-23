//
//  TALoadingView.m
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TALoadingView.h"
#import <QuartzCore/QuartzCore.h>
@implementation TALoadingView
static TALoadingView *mLoadingView = nil;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)initIsLikeSynchro:(BOOL)isLikeSynchro title:(NSString*)title{
    if (isLikeSynchro) {
        self = [super initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    }else{
        self = [super initWithFrame:CGRectMake((SCREEN_WIDTH-150)/2, ([UIApplication sharedApplication].keyWindow.bounds.size.height-80)/2, 150, 80)];
    }
    
    if (self) {
        self.isLikeSynchro = isLikeSynchro;
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
        
        conerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 80)];
        
        [self setCenter:conerView withParentRect:self.frame];
        UIColor *color = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.65];
        conerView.backgroundColor = color;
        [self addSubview:conerView];
        
        indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(50, 0, 50, 50)];
        [conerView addSubview:indicatorView];
        [indicatorView startAnimating];
        
        UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 150, 40)];
        lblTitle.backgroundColor = [UIColor clearColor];
        lblTitle.textColor = [UIColor whiteColor];
        lblTitle.textAlignment = NSTextAlignmentCenter;
        lblTitle.text = title;
        lblTitle.font = [UIFont systemFontOfSize:14];
        [conerView addSubview:lblTitle];
        
        conerView.layer.cornerRadius = 8;
        conerView.layer.masksToBounds = YES;
    }
    return self;
}

- (void)show{
    if ([UIApplication sharedApplication].keyWindow.rootViewController.navigationController) {
        [[UIApplication sharedApplication].keyWindow.rootViewController.navigationController.view addSubview:self];
    }else{
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
}

- (void)close{
    [self removeFromSuperview];
}

+ (TALoadingView *)shareLoadingViewWithTitle:(NSString*)title{
    @synchronized(self){
        if (mLoadingView==nil) {
            mLoadingView = [[self alloc] initIsLikeSynchro:NO title:title];
        }
    }
    return mLoadingView;
}

+ (id)allocWithZone:(NSZone *)zone{
    @synchronized(self){
        if (mLoadingView==nil) {
            mLoadingView = [super allocWithZone:zone];
            return mLoadingView;
        }
    }
    return  nil;
}

///设置子View在父View中居中
- (void)setCenter:(UIView *)child withParentRect:(CGRect)parentRect{
    CGRect rect = child.frame;
    rect.origin.x = (parentRect.size.width - child.frame.size.width)/2;
    rect.origin.y = (parentRect.size.height - child.frame.size.height)/2;
    child.frame = rect;
}
@end
