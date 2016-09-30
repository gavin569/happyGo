//
//  TATravelOrderDetailViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/29.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TATravelOrderDetailViewController.h"
#import "TACollectionViewCell.h"
#import "TAOrderSmallModel.h"
@interface TATravelOrderDetailViewController ()

@end

@implementation TATravelOrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"订单详情";
    [self setupUI];
}
#pragma mark -- setup UI 
- (void)setupUI{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    _bomCollectionView.collectionViewLayout=flowLayout;
    _bomCollectionView.delegate=self;
    _bomCollectionView.dataSource=self;
    _bomCollectionView.pagingEnabled = YES;
    _bomCollectionView.bounces = YES;
    _bomCollectionView.showsVerticalScrollIndicator = NO;
   _bomCollectionView.showsHorizontalScrollIndicator = NO;
    _bomCollectionView.backgroundColor=COLOR_ffffff;
    UINib *nib=[UINib nibWithNibName:@"TACollectionViewCell" bundle:[NSBundle mainBundle]];
    [_bomCollectionView registerNib:nib forCellWithReuseIdentifier:@"TACollectionViewCell"];
    _lineNameLab.text=_model.routesId;
    _numberPeopleLab.text=_model.tourismNum;
    _dateLab.text=_model.touristDate;
    _phoneLab.text=_model.toursimPhone;
    
    
}
#pragma mark --UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数

-( NSInteger )collectionView:( UICollectionView *)collectionView numberOfItemsInSection:( NSInteger )section
{
    return _model.smallArr.count;
}
//定义展示的Section的个数
-( NSInteger )numberOfSectionsInCollectionView:( UICollectionView *)collectionView

{
    return 1 ;
}
//每个UICollectionView展示的内容
-( UICollectionViewCell *)collectionView:( UICollectionView *)collectionView cellForItemAtIndexPath:( NSIndexPath *)indexPath
{
    TACollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier :@"TACollectionViewCell" forIndexPath :indexPath];
    TAOrderSmallModel *model=_model.smallArr[indexPath.row];
    cell.ZZLab.text=model.carName;
    cell.SJNamelLab.text=model.carPhone;
    cell.moneyLabA.text=model.payMoneyCar;
    cell.DYLab.text=model.guideName;
    cell.moneyLabB.text=model.payMoneyGuide;
    return cell;
}

#pragma mark --UICollectionViewDelegate

-( BOOL )collectionView:( UICollectionView *)collectionView shouldSelectItemAtIndexPath:( NSIndexPath *)indexPath
{
    return YES ;
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个UICollectionView 的大小

- ( CGSize )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:( NSIndexPath *)indexPath
{
    return CGSizeMake (SCREEN_WIDTH , 200);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
