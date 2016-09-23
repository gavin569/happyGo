//
//  TAAlertView.m
//  TravelAgency
//
//  Created by edianzu on 16/9/9.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAAlertView.h"
const CGFloat kAlertViewLineWidth = 0.5f;
const CGFloat kAlertViewMargin = 40.f;
const CGFloat kAlertViewCornerRadius = 11.f;
const CGFloat kAlertViewContentMargin = 12.f;
const CGFloat kAlertViewButtonHeight = 51.f;
@implementation TAAlertViewQueue
+ (instancetype)sharedQueue {
    static TAAlertViewQueue *sharedQueue = nil;
    @synchronized(self) {
        if (!sharedQueue) {
            sharedQueue = [[TAAlertViewQueue alloc] init];
        }
    }
    
    return sharedQueue;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _alertMArr = [NSMutableArray array];
        
    }
    return self;
}

- (NSInteger)alertConuts {
    return _alertMArr.count;
}

- (void)addAlertView:(TAAlertView *)alertView {
    if (!_alertMArr.count) {
        [alertView show];
    }
    [_alertMArr addObject:alertView];
}

- (void)removeAlertView:(TAAlertView *)alertView {
    [_alertMArr removeObject:alertView];
    TAAlertView *first = [_alertMArr firstObject];
    if (first) {
        [first show];
    }
}
@end
@implementation TAAlertView
- (id)initAlertWithTitle:(NSString *)title
             contentView:(UIView *)contentView
                 message:(NSString *)message
        messageAlignment:(NSTextAlignment)alignment
             cancelTitle:(NSString *)cancelTitle
              otherTitle:(NSString *)otherTitle
              completion:(CanceledBlock)completion {
    self = [super init];
    if (self) {
        _mainWindow = [[[UIApplication sharedApplication] delegate] window];
        _alertWindow = [self windowWithLevel:UIWindowLevelAlert];
        _alertWindow.rootViewController = [UIViewController new];
        _alertWindow.rootViewController.view.backgroundColor = [UIColor clearColor];
        self.frame = _alertWindow.bounds;
        
        _backgroundView = [[UIView alloc] initWithFrame:_alertWindow.bounds];
        _backgroundView.backgroundColor = BACKGROUND_COLOR;
        _backgroundView.alpha = 0;
        [self addSubview:_backgroundView];
        
        CGFloat alertWidth = SCREEN_WIDTH - kAlertViewMargin * 2;
        _alertView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, alertWidth, 0)];
        _alertView.backgroundColor = ALERT_BACKGROUND_COLOR;
        _alertView.layer.cornerRadius = kAlertViewCornerRadius;
        _alertView.layer.opacity = 0.95f;
        _alertView.clipsToBounds = YES;
        [self addSubview:_alertView];
        
        // Title
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kAlertViewContentMargin, 21, alertWidth - kAlertViewContentMargin * 2, 0)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.text = title;
        _titleLabel.font = SYS_B_F(17);
        _titleLabel.textColor = COLOR_333333;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
        CGSize titleSize = [_titleLabel sizeThatFits:CGSizeMake(alertWidth - kAlertViewContentMargin * 2, 0)];
        _titleLabel.frame = CGRectMake(kAlertViewContentMargin, 23, alertWidth - kAlertViewContentMargin * 2, titleSize.height);
        [_alertView addSubview:_titleLabel];
        
        
        CGFloat messageLabelY = CGRectGetMaxY(_titleLabel.frame) + 15;
        
        if (contentView)
        {
            _contentView = contentView;
            _contentView.center = CGPointMake(alertWidth / 2, CGRectGetMaxY(_titleLabel.frame) + CGRectGetHeight(_contentView.frame) / 2);
            [_alertView addSubview:_contentView];
            messageLabelY += contentView.frame.size.height + 15;
        }
        
        // Message
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(kAlertViewContentMargin, messageLabelY, alertWidth - kAlertViewContentMargin * 2, 0)];
        
        if ([message isKindOfClass:[NSAttributedString class]]) {
            _messageLabel.attributedText = (NSAttributedString *)message;
        }
        else {
            _messageLabel.text = message;
            _messageLabel.textColor = COLOR_333333;
        }
        
        _messageLabel.backgroundColor = [UIColor clearColor];
        _messageLabel.textAlignment = alignment;
        _messageLabel.font = SYS_F(16);
        _messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _messageLabel.numberOfLines = 0;
        CGSize messageSize = [_messageLabel sizeThatFits:CGSizeMake(alertWidth - 80, 0)];
        _messageLabel.frame = CGRectMake(40, messageLabelY, alertWidth - 80, messageSize.height);
        [_alertView addSubview:_messageLabel];
        
        // Line
        CALayer *lineLayer = [CALayer layer];
        lineLayer.backgroundColor = COLOR_d1d1d1.CGColor;
        lineLayer.frame = CGRectMake(12, CGRectGetMaxY(_messageLabel.frame) + 23, alertWidth - 24, kAlertViewLineWidth);
        [_alertView.layer addSublayer:lineLayer];
        
        // Buttons
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_cancelButton setTitle:cancelTitle ? cancelTitle : @"取消" forState:UIControlStateNormal];
        [_cancelButton setBackgroundImage:IMAGE_WITH_COLOR([UIColor clearColor]) forState:UIControlStateNormal];
        _cancelButton.backgroundColor = [UIColor clearColor];
        _cancelButton.titleLabel.font = SYS_F(17);
        [_cancelButton setTitleColor:COLOR_333333 forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [_cancelButton addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat buttonsY = CGRectGetMaxY(lineLayer.frame);
        if (otherTitle) {
            _cancelButton.titleLabel.font = SYS_F(17);
            _cancelButton.frame = CGRectMake(0, buttonsY, alertWidth / 2 - 0.5, kAlertViewButtonHeight);
            
            _otherButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [_otherButton setTitle:otherTitle forState:UIControlStateNormal];
            [_otherButton setBackgroundImage:IMAGE_WITH_COLOR([UIColor clearColor]) forState:UIControlStateNormal];
            //            [_otherButton setBackgroundImage:IMAGE_WITH_COLOR([UIColor lightGrayColor]) forState:UIControlStateHighlighted];
            _otherButton.backgroundColor = [UIColor clearColor];
            _otherButton.titleLabel.font = SYS_F(17);
            [_otherButton setTitleColor:COLOR_f04c42 forState:UIControlStateNormal];
            [_otherButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
            [_otherButton addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
            _otherButton.frame = CGRectMake(alertWidth / 2 + 0.5, buttonsY, alertWidth / 2 - 0.5, kAlertViewButtonHeight);
            [_alertView addSubview:_otherButton];
            
            CALayer *lineLayer = [CALayer layer];
            lineLayer.backgroundColor = [ALERT_LINE_COLOR CGColor];
            lineLayer.frame = CGRectMake(CGRectGetMinX(_otherButton.frame), CGRectGetMinY(_otherButton.frame) + 10, kAlertViewLineWidth, kAlertViewButtonHeight - 20);
            [_alertView.layer addSublayer:lineLayer];
        }
        else {
            [_cancelButton setTitleColor:COLOR_f04c42 forState:UIControlStateNormal];
            _cancelButton.frame = CGRectMake(0, buttonsY, alertWidth, kAlertViewButtonHeight);
        }
        
        [_alertView addSubview:_cancelButton];
        
        _alertView.bounds = CGRectMake(0, 0, alertWidth, CGRectGetMaxY(_cancelButton.frame));
        
        _alertView.center = CGPointMake(CGRectGetMidX(_alertWindow.bounds), CGRectGetMidY(_alertWindow.bounds));
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
        [self addGestureRecognizer:tapGesture];
        
        if (completion) {
            _completion = completion;
        }
    }
    return self;
}



- (UIWindow *)windowWithLevel:(UIWindowLevel)windowLevel {
    NSArray *windows = [[UIApplication sharedApplication] windows];
    for (UIWindow *window in windows) {
        if (window.windowLevel == windowLevel) {
            return window;
        }
    }
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    window.windowLevel = windowLevel;
    return window;
}

- (void)addToQueue
{
    [[TAAlertViewQueue sharedQueue] addAlertView:self];
}

- (void)show
{
    [_alertWindow.rootViewController.view addSubview:self];
    [_alertWindow makeKeyAndVisible];
    [self showBackgroundView];
    [self showAlertAnimation];
}

- (void)showBackgroundView {
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        
    }
    [UIView animateWithDuration:0.3 animations:^ {
        _backgroundView.alpha = 1;
    }];
}

- (void)dismiss:(id)sender
{
    if ([[TAAlertViewQueue sharedQueue] alertConuts] == 1)
    {
        [self dismissAlertAnimation];
        if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
            //_mainWindow.tintAdjustmentMode = UIViewTintAdjustmentModeAutomatic;
            //[_mainWindow tintColorDidChange];
        }
        [UIView animateWithDuration:0.2 animations:^{
            _backgroundView.alpha = 0;
            
            [_mainWindow makeKeyAndVisible];
        }];
    }
    
    [UIView animateWithDuration:0.2 animations:^
     {
         _alertView.alpha = 0;
     }
                     completion:^(BOOL finished)
     {
         [[TAAlertViewQueue sharedQueue] removeAlertView:self];
         [self removeFromSuperview];
     }];
    
    BOOL cancelled;
    if (sender == _cancelButton || [sender isKindOfClass:[UITapGestureRecognizer class]])
    {
        cancelled = YES;
    }
    else
    {
        cancelled = NO;
    }
    if (self.completion)
    {
        self.completion(cancelled);
    }
}

- (void)showAlertAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    animation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.05, 1.05, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1)]];
    animation.keyTimes = @[ @0, @0.5, @1 ];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = .3;
    
    [_alertView.layer addAnimation:animation forKey:@"showAlert"];
}

- (void)dismissAlertAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    animation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.95, 0.95, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1)]];
    animation.keyTimes = @[ @0, @0.5, @1 ];
    animation.fillMode = kCAFillModeRemoved;
    animation.duration = .2;
    
    [_alertView.layer addAnimation:animation forKey:@"dismissAlert"];
}

- (void)hide
{
    [self removeFromSuperview];
}

+ (TAAlertView *)showAlertWithTitle:(NSString *)title
                        contentView:(UIView *)contentView
                            message:(NSString *)message
                        cancelTitle:(NSString *)cancelTitle
                         otherTitle:(NSString *)otherTitle
                         completion:(void(^) (BOOL cancelled))completion
{
    TAAlertView *alertView = [[TAAlertView alloc] initAlertWithTitle:title contentView:contentView message:message messageAlignment:NSTextAlignmentCenter cancelTitle:cancelTitle otherTitle:otherTitle completion:completion];
    [alertView addToQueue];
    return alertView;
}

+ (TAAlertView *)showAlertWithTitle:(NSString *)title
                        contentView:(UIView *)contentView
                        leftMessage:(NSString *)message
                        cancelTitle:(NSString *)cancelTitle
                         otherTitle:(NSString *)otherTitle
                         completion:(void(^) (BOOL cancelled))completion
{
    TAAlertView *alertView = [[TAAlertView alloc] initAlertWithTitle:title contentView:contentView message:message messageAlignment:NSTextAlignmentLeft cancelTitle:cancelTitle otherTitle:otherTitle completion:completion];
    [alertView addToQueue];
    return alertView;
}

+ (TAAlertView *)showAlertWithTitle:(NSString *)title
                            message:(NSString *)message
                        cancelTitle:(NSString *)cancelTitle
{
    TAAlertView *alertView = [[TAAlertView alloc] initAlertWithTitle:title contentView:nil message:message messageAlignment:NSTextAlignmentCenter cancelTitle:cancelTitle otherTitle:nil completion:nil];
    [alertView addToQueue];
    return alertView;
}


@end
