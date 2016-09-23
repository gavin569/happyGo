//
//  TAMidbodyViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/6.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAMidbodyViewController.h"

@interface TAMidbodyViewController ()
{
    int _index;
}
@end

@implementation TAMidbodyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([TACommonTool userInfo]) {
        NSDictionary *userDic=[TACommonTool userInfo];
        NSString *roleId=[NSString stringWithFormat:@"%@",userDic[@"roleId"]];
        _index =[roleId intValue];
            switch (_index) {
                case 1:
                {
                    [TACommonTool gotoJiaoDanVc];
                }
                    break;
                case 2:
                {
                    [TACommonTool gotoTraveHotelVc];
                }
                    break;
                case 3:
                {
                    [TACommonTool gotoTraveDriverVc];
                }
                    break;
                case 4:
                {
                    [TACommonTool gotoTraveTouristVc];
                }
                    break;
                case 5:
                {
                    [TACommonTool gotoOwnersVc];
                }
                    break;
                    
                default:
                    break;
            }
    }else{
        [TACommonTool gotoLoginVc];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
