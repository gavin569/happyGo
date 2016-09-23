//
//  WJDatePickerView.m
//  paymentViewDemo
//
//  Created by edianzu on 16/9/20.
//  Copyright © 2016年 zhoujianfeng. All rights reserved.
//

#import "WJDatePickerView.h"
@implementation WJDatePickerView

- (void)show{
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
    self.frame = SCREEN_BOUNDS;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.datePickerView = [[[NSBundle mainBundle] loadNibNamed:@"datePickerView" owner:nil options:nil] lastObject];
    __weak WJDatePickerView *weakSelf = self;
    _datePickerView.block=^(NSString* dateStr){

        if (weakSelf.block) {
            weakSelf.block(dateStr);
        }
    };
    self.datePickerView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 250);
    [[UIApplication sharedApplication].keyWindow addSubview:self.datePickerView];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.datePickerView.transform = CGAffineTransformTranslate(self.datePickerView.transform, 0, -250);

    }];
}
- (void)dismiss {
    [UIView animateWithDuration:0.25 animations:^{
        self.datePickerView.transform = CGAffineTransformTranslate(self.datePickerView.transform, 0, 250);

    } completion:^(BOOL finished) {
        [self.datePickerView removeFromSuperview];
        [self removeFromSuperview];
    }];

}
@end
