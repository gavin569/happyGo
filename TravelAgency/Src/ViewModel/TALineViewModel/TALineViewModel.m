//
//  TALineViewModel.m
//  TravelAgency
//
//  Created by edianzu on 16/9/14.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TALineViewModel.h"
#import "TALineInOwnerModel.h"
#import "TALineListModel.h"
@implementation TALineViewModel
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _travelArr = [[NSArray alloc]init];
        _lineListArr = [[NSMutableArray alloc]init];
    }
    return self;
}
//请求车主的所有路线
- (void)requestAllRoutesInOwnerSuccess:(SuccessBlock)success
                               failure:(void (^)())failure {
    [NetworkService requestAllRoutesInOwnerSuccess:^(NSDictionary *result) {
        NSArray *arr=result[@"routesList"];
        NSMutableArray *allRoutesArr=[[NSMutableArray alloc]init];
         NSMutableArray *travelArr=[[NSMutableArray alloc]init];
        for (int i=0; i<arr.count; i++) {
            TALineInOwnerModel *model=[[TALineInOwnerModel alloc]initWithDictionary:arr[i]];
            [allRoutesArr addObject:model];
            [travelArr addObject:model.userName];
        }
        NSSet *set = [NSSet setWithArray:travelArr];
        self.travelArr=[set allObjects];
        NSMutableArray *smallArr=[[NSMutableArray alloc]init];
        for (int i=0; i<_travelArr.count; i++) {
            for (int j=0; j<allRoutesArr.count; j++) {
               TALineInOwnerModel *model=allRoutesArr[j];
                if ([model.userName isEqualToString:_travelArr[i]]) {
                    [smallArr addObject:model];
                }
            }
            [self.lineListArr addObject:smallArr];
        }
        success(_travelArr,_lineListArr);
    } failure:^{
        
    }];
}
//一日游路线
- (void)requestOneDayLineSuccess:(SuccessBlock)success
                         failure:(void (^)())failure{
   [NetworkService requestOneDayLinesuccess:^(NSDictionary *result) {
       NSArray *arr=result[@"fixedLineList"];
       NSMutableArray *lineModelArr=[[NSMutableArray alloc]init];
       NSMutableArray *lineIdArr=[[NSMutableArray alloc]init];
       for (int i=0; i<arr.count; i++) {
           TALineListModel*model=[[TALineListModel alloc]initWithDictionary:arr[i]];
           NSString *lineName=model.lineName;
           NSString *lineId=[NSString stringWithFormat:@"%@",model.fixedLine];

           [lineModelArr addObject:lineName];
           [lineIdArr addObject:lineId];
       }
       
       success(lineModelArr,lineIdArr);
       
   } failure:^{
       
   }];
}
//团队游路线
- (void)requestAllTeamLineSuccess:(SuccessBlock)success
                          failure:(void (^)())failure{
    [NetworkService requestAllTeamLinesuccess:^(NSDictionary *result) {
         NSLog(@"---%@",result);
    } failure:^{
        
    }];
}
@end
