//
//  TATravelSceneViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/29.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TATravelSceneViewController.h"
#import "TAScenceTableViewCell.h"
#import "TASenceModel.h"
@interface TATravelSceneViewController ()

@end

@implementation TATravelSceneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"景点";
    [self customNavigationBarRightItemWithImage:[UIImage imageNamed:@"S_6.png"] action:@selector(rightButonClick)];
    [self.view addSubview:self.sceneTableView];
    _viewModel=[[TASelfCenterViewModel alloc]init];
    [self requestAllSence];
    
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sceneArr.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TAScenceTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"TAScenceTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TAScenceTableViewCell" owner:nil options:nil] firstObject];
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    TASenceModel *model=self.sceneArr[indexPath.row];
    cell.JDLab.text=model.attractionsName;
    cell.allTicketLab.text=[NSString stringWithFormat:@"全票:%@元／人",model.price1];
    cell.halfTicketLab.text=[NSString stringWithFormat:@"半票:%@元／人",model.price2];
    [cell.JDImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ROOT_URL,model.picture]] placeholderImage:[UIImage imageNamed:@"S_6.png"]];
    [cell.selectButton addTarget:self action:@selector(selectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectButton.tag=indexPath.row;
    if ([model.isSelcted isEqualToString:@"0"]) {
        [cell.selectButton setImage:[UIImage imageNamed:@"S_6.png"] forState:UIControlStateNormal];
    }else{
       [cell.selectButton setImage:[UIImage imageNamed:@"smallLogin.png"] forState:UIControlStateNormal];
    }
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.01;
}
#pragma mark -- Event Response
- (void)rightButonClick {
    NSString *jdStr=@"";
    for (int i=0; i<_JDNameArr.count; i++) {
        NSString *str=[NSString stringWithFormat:@"%@,",_JDNameArr[i]];
        jdStr=[jdStr stringByAppendingString:str];
    }
    if (_sceneBlock) {
        _sceneBlock(jdStr);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)selectButtonClick:(UIButton*)button {
    TASenceModel *model=_sceneArr[button.tag];
    if ([model.isSelcted isEqualToString:@"0"]) {
        model.isSelcted=@"1";
        [self.JDNameArr addObject:model.attractionsName];
    }else{
        model.isSelcted=@"0";
        [self.JDNameArr removeObject:model.attractionsName];
    }
    [self.sceneArr replaceObjectAtIndex:button.tag withObject:model];
    [_sceneTableView reloadData];
}
#pragma mark -- Private Method
- (void)requestAllSence {
  [_viewModel requestAllSencesListSuccess:^(NSArray *messageArr) {
      [self.sceneArr addObjectsFromArray:messageArr];
      [_sceneTableView reloadData];
  } failure:^{
      
  }];
}
#pragma mark -- GettersAndSetters
- (UITableView*)sceneTableView {
    if (!_sceneTableView) {
        _sceneTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 70, SCREEN_WIDTH, SCREEN_HEIGHT-70) style:UITableViewStyleGrouped];
        _sceneTableView.backgroundColor = COLOR_ffffff;
        _sceneTableView.rowHeight=100;
        _sceneTableView.delegate=self;
        _sceneTableView.dataSource=self;
        _sceneTableView.showsHorizontalScrollIndicator=NO;
        _sceneTableView.showsVerticalScrollIndicator=NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return _sceneTableView;
}
#pragma mark -- GettersAndSetters
- (NSMutableArray*)sceneArr{
    if (!_sceneArr) {
        _sceneArr=[[NSMutableArray alloc]init];
    }
    return _sceneArr;
}
- (NSMutableArray*)JDNameArr {
    if (!_JDNameArr) {
        _JDNameArr =[[NSMutableArray alloc]init];
    }
    return _JDNameArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
