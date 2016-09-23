//
//  TARoleButton.m
//  TravelAgency
//
//  Created by edianzu on 16/9/9.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TARoleButton.h"

@implementation TARoleButton

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        _topImageView=[[UIImageView alloc]init];
        [self addSubview:_topImageView];
        float width=(SCREEN_WIDTH-65)/4-20;
        [_topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(10);
            make.centerX.equalTo(self);
            make.width.equalTo(@(width));
            make.height.equalTo(@(width));
        }];
        _bomLab=[[UILabel alloc]init];
        _bomLab.font=SYS_F(12);
        _bomLab.textColor=[UIColor blackColor];
        [self addSubview:_bomLab];
        [_bomLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_topImageView.mas_bottom).with.offset(5);
            make.centerX.equalTo(self.mas_centerX);
        }];
        
    }
    
    return self;
    
}
@end
