//
//  TAOwnerHeaderView.m
//  TravelAgency
//
//  Created by edianzu on 16/9/14.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAOwnerHeaderView.h"

@implementation TAOwnerHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor greenColor];
        _leftImage=[[UIImageView alloc]init];
        _leftImage.image=[UIImage imageNamed:@"S_6.png"];
        [self addSubview:_leftImage];
        [_leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(11);
            make.centerY.equalTo(self);
            make.width.equalTo(@20);
            make.height.equalTo(@20);
        }];
        _leftLab=[[UILabel alloc]init];
        _leftLab.font=SYS_F(14);
        _leftLab.textColor=COLOR_333333;
        [self addSubview:_leftLab];
        [_leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_leftImage.mas_right).with.offset(5);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}
@end
