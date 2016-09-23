//
//  TAAlertView.h
//  TravelAgency
//
//  Created by edianzu on 16/9/9.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^CanceledBlock)(BOOL canceled);
@interface TAAlertView : UIView{
    UIWindow *_mainWindow;
    UIWindow *_alertWindow;
    UIView   *_backgroundView;
    UIView   *_alertView;
    UILabel  *_titleLabel;
    UIView   *_contentView;
    UILabel  *_messageLabel;
    UIButton *_cancelButton;
    UIButton *_otherButton;
}
@property (nonatomic, copy) CanceledBlock completion;
- (id)initAlertWithTitle:(NSString *)title
             contentView:(UIView *)contentView
                 message:(NSString *)message
        messageAlignment:(NSTextAlignment)alignment
             cancelTitle:(NSString *)cancelTitle
              otherTitle:(NSString *)otherTitle
              completion:(CanceledBlock)completion;

+ (TAAlertView *)showAlertWithTitle:(NSString *)title
                        contentView:(UIView *)contentView
                            message:(NSString *)message
                        cancelTitle:(NSString *)cancelTitle
                         otherTitle:(NSString *)otherTitle
                         completion:(void(^) (BOOL cancelled))completion;

+ (TAAlertView *)showAlertWithTitle:(NSString *)title
                        contentView:(UIView *)contentView
                        leftMessage:(NSString *)message
                        cancelTitle:(NSString *)cancelTitle
                         otherTitle:(NSString *)otherTitle
                         completion:(void(^) (BOOL cancelled))completion;

+ (TAAlertView *)showAlertWithTitle:(NSString *)title
                            message:(NSString *)message
                        cancelTitle:(NSString *)cancelTitle;

- (void)show;

- (void)hide;

@end

@interface TAAlertViewQueue : NSObject
{
    NSMutableArray *_alertMArr;
}

- (NSInteger)alertConuts;

- (void)removeAlertView:(TAAlertView *)alertView;

- (void)addAlertView:(TAAlertView *)alertView;
@end
