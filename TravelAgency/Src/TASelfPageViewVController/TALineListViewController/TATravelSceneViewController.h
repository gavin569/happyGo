//
//  TATravelSceneViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/29.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"
#import "TASelfCenterViewModel.h"
typedef void(^SceneBlock)(NSString*sceneString);
@interface TATravelSceneViewController : TABaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *sceneTableView;
@property (nonatomic, strong) TASelfCenterViewModel *viewModel;
@property (nonatomic, strong) NSMutableArray *sceneArr;
@property (nonatomic, strong) NSMutableArray *JDNameArr;
@property (nonatomic, copy) SceneBlock sceneBlock;
@end
