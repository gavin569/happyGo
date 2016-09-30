//
//  TACollectionViewCell.h
//  TravelAgency
//
//  Created by edianzu on 16/9/29.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TACollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *ZZLab;
@property (weak, nonatomic) IBOutlet UILabel *SJNamelLab;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabA;
@property (weak, nonatomic) IBOutlet UILabel *DYLab;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabB;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewA;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewB;

@end
