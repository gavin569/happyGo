//
//  TAJiaoDanViewModel.m
//  TravelAgency
//
//  Created by edianzu on 16/9/26.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAJiaoDanViewModel.h"
#import "TAJiaoDanModel.h"
@implementation TAJiaoDanViewModel
//查询路线信息
- (void)requestRoutesWithfixedLine:(int)fixedLine
                           Success:(SuccessBlockA)success
                           failure:(void (^)())failure{
    
[NetworkService serachRoutesInJiaoDanWithFixedLine:fixedLine success:^(NSDictionary *result) {
    NSArray *arr=result[@"data"];
    NSMutableArray *lineArr=[[NSMutableArray alloc]init];
    for (int i=0; i<arr.count; i++) {
        TAJiaoDanModel *model=[[TAJiaoDanModel alloc]initWithDictionary:arr[i]];
        [lineArr addObject:model];
    }
    success(lineArr);
} failure:^{
    failure();
}];
    
}
- (void)submitOrderMessageWithDictionary:(NSDictionary*)dic
                                 Success:(SuccessStringBlock)success
                                 failure:(void (^)())failure {
    [NetworkService submitOrderWithDictionary:dic success:^(NSDictionary *result) {
        NSString*statusStr=[NSString stringWithFormat:@"%@",result[@"status"]];
        success(statusStr);
    } failure:^{
        failure();
    }];
}
@end
