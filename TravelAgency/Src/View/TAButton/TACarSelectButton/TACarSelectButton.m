//
//  TACarSelectButton.m
//  TravelAgency
//
//  Created by edianzu on 16/9/18.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TACarSelectButton.h"

@implementation TACarSelectButton

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setTitleColor:COLOR_d1d1d1 forState:UIControlStateNormal];
        self.titleLabel.font=SYS_F(14);
        _leftLab=[[UILabel alloc]init];
        _leftLab.font=SYS_F(14);
        [_leftLab setTextAlignment:NSTextAlignmentLeft];
        _leftLab.textColor=COLOR_d1d1d1;
        [self addSubview:_leftLab];
        [_leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(11);
            make.centerY
            .equalTo(self);
        }];
        _rightImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"A.png"]];
        [self addSubview:_rightImageView];
        [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).with.offset(-5);
            make.centerY.equalTo(self);
            make.width.equalTo(@10);
            make.height.equalTo(@15);
            
        }];
}
    
    return self;
    
}

@end
