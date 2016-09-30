//
//  TATravelOrderDetailViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/29.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"
#import "TAOrderBigModel.h"
@interface TATravelOrderDetailViewController : TABaseViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lineNameLab;
@property (weak, nonatomic) IBOutlet UILabel *numberPeopleLab;
@property (weak, nonatomic) IBOutlet UILabel *dateLab;
@property (weak, nonatomic) IBOutlet UILabel *phoneLab;
@property (weak, nonatomic) IBOutlet UICollectionView *bomCollectionView;
@property (nonatomic, strong) TAOrderBigModel *model;
@end
