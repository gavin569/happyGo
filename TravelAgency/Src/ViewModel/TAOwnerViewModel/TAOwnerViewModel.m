//
//  TAOwnerViewModel.m
//  TravelAgency
//
//  Created by edianzu on 16/9/14.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAOwnerViewModel.h"
#import "TAOwnerCarTypeModel.h"
@implementation TAOwnerViewModel
//请求车主的所有路线
- (void)requestAllCarTypesInOwnerSuccess:(SuccessBlockA)success
                                 failure:(void (^)())failure{
    [NetworkService requestAllCarTypesInOwnerSuccess:^(NSDictionary *result) {
        NSArray *array=result[@"carTypeList"];
        NSMutableArray *carTypeListArr=[[NSMutableArray alloc]init];
        for (int i=0; i<array.count; i++) {
            TAOwnerCarTypeModel *model=[[TAOwnerCarTypeModel alloc]initWithDictionary:array[i]];
            [carTypeListArr addObject:model];
        }
        success(carTypeListArr);
    } failure:^{
        
    }];
}
@end
