//
//  TAJiaoDanViewModel.h
//  TravelAgency
//
//  Created by edianzu on 16/9/26.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^SuccessBlockA)(NSArray*LineArray);
typedef void(^SuccessStringBlock)(NSString*resulstStr);
@interface TAJiaoDanViewModel : NSObject
//查询路线信息
- (void)requestRoutesWithfixedLine:(int)fixedLine
                           Success:(SuccessBlockA)success
                          failure:(void (^)())failure;
//交单
- (void)submitOrderMessageWithDictionary:(NSDictionary*)dic
                                 Success:(SuccessStringBlock)success
                                 failure:(void (^)())failure;

@end
