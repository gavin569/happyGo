//
//  TABasePickerView.m
//  paymentViewDemo
//
//  Created by edianzu on 16/9/21.
//  Copyright © 2016年 zhoujianfeng. All rights reserved.
//

#import "TABasePickerView.h"
@implementation TABasePickerView

- (void)show{
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
    self.frame = SCREEN_BOUNDS;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.pickerView = [[[NSBundle mainBundle] loadNibNamed:@"TAPickerView" owner:nil options:nil] lastObject];
    _pickerView.arr=_arr;
    __weak TABasePickerView *weakSelf = self;
    _pickerView.stringBlock=^(NSString* resultStr){
        
        if (weakSelf.block) {
            weakSelf.block(resultStr);
        }
    };
    self.pickerView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 250);
    [[UIApplication sharedApplication].keyWindow addSubview:self.pickerView];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.pickerView.transform = CGAffineTransformTranslate(self.pickerView.transform, 0, -250);
        
    }];
}
- (void)dismiss {
    [UIView animateWithDuration:0.25 animations:^{
        self.pickerView.transform = CGAffineTransformTranslate(self.pickerView.transform, 0, 250);
        
    } completion:^(BOOL finished) {
        [self.pickerView removeFromSuperview];
        [self removeFromSuperview];
    }];
    
}

@end
