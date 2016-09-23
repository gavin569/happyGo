//
//  TALineAndRegisterTableViewCell.m
//  TravelAgency
//
//  Created by edianzu on 16/9/12.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TALineAndRegisterTableViewCell.h"

@implementation TALineAndRegisterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        _selectButton=[[TASelectButton alloc]init];
        [_selectButton setTitleColor:COLOR_333333 forState:UIControlStateNormal];
        _selectButton.titleLabel.font=SYS_F(14);
        [self.contentView addSubview:_selectButton];
        [_selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.width.equalTo(@(SCREEN_WIDTH -120));
        }];
        
        
    }
    
    return self;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
