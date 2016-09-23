//
//  TASelectButton.m
//  TravelAgency
//
//  Created by edianzu on 16/9/8.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TASelectButton.h"

@implementation TASelectButton

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        _lineView=[[UIView alloc]init];
        _lineView.backgroundColor=[UIColor blackColor];
        [self addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self.mas_bottom).with.offset(-1);
            make.height.equalTo(@1);
        }];
        _leftImageView=[[UIImageView alloc]init];
        [self addSubview:_leftImageView];
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(5);
            make.width.equalTo(@15);
            make.height.equalTo(@15);
            make.centerY.equalTo(self);
        }];
      
    }
    
    return self;
    
}
@end
