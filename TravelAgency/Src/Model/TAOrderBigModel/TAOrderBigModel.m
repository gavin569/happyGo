//
//  TAOrderBigModel.m
//  TravelAgency
//
//  Created by edianzu on 16/9/29.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAOrderBigModel.h"
#import "TAOrderSmallModel.h"
@implementation TAOrderBigModel
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        self.orderDate     = dict[@"orderDate"];
        self.orderId      = dict[@"orderId"];
        self.orderInfoId      = dict[@"orderInfoId"];
        self.orderStatus      = [NSString stringWithFormat:@"%@",dict[@"orderStatus"]];
        self.payStatus      = [NSString stringWithFormat:@"%@",dict[@"payStatus"]];
        self.routesId      = [NSString stringWithFormat:@"%@",dict[@"routesId"]];
        self.tourismNum      = [NSString stringWithFormat:@"%@",dict[@"tourismNum"]];
        self.touristDate      = dict[@"touristDate"];
        self.toursimPhone      = dict[@"toursimPhone"];
        self.billList       =dict[@"billList"];
        for (int i=0; i<_billList.count; i++) {
            TAOrderSmallModel*model=[[TAOrderSmallModel alloc]initWithDictionary:_billList[i]];
            [self.smallArr addObject:model];
        }
    }
    return self;
}
- (NSMutableArray*)smallArr{
    if (!_smallArr) {
        _smallArr=[[NSMutableArray alloc]init];
    }
    return _smallArr;
}
@end
