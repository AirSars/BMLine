//
//  TestViewController.m
//  BMLine
//
//  Created by NADA_BM on 15/10/21.
//  Copyright © 2015年 NADA_BM. All rights reserved.
//

#import "TestViewController.h"
#import "UIView+BMLine.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_upVIew addLineWithType:BMLineTypeCustomDefault color:nil position:BMLinePostionCustomBottom];
    [_upVIew addLineWithType:BMLineTypeCustomDefault color:[UIColor redColor] position:BMLinePostionCustomCenterX];
    [_upVIew addLineWithType:BMLineTypeCustomDefault color:[UIColor redColor] position:BMLinePostionCustomCenterX];
    [_upVIew addLineWithType:BMLineTypeCustomDefault color:[UIColor blueColor] position:BMLinePostionCustomTop];
    [_upVIew addLineWithType:BMLineTypeCustomDefault color:[UIColor blackColor] position:BMLinePostionCustomLeft];
    [_upVIew addLineWithType:BMLineTypeCustomDefault color:[UIColor yellowColor] position:BMLinePostionCustomCenterY];
    [_upVIew addLineWithType:BMLineTypeCustomDefault color:[UIColor orangeColor] position:BMLinePostionCustomRight];
    
    [_midVIew addLineWithType:BMLineTypeCustomDash color:nil position:BMLinePostionCustomTop];
    [_midVIew addLineWithType:BMLineTypeCustomDash color:[UIColor redColor] position:BMLinePostionCustomCenterX];
    [_midVIew addLineWithType:BMLineTypeCustomDash color:[UIColor blueColor] position:BMLinePostionCustomBottom];
    [_midVIew addLineWithType:BMLineTypeCustomDash color:[UIColor yellowColor] position:BMLinePostionCustomLeft];
    [_midVIew addLineWithType:BMLineTypeCustomDash color:[UIColor blackColor] position:BMLinePostionCustomCenterY];
    [_midVIew addLineWithType:BMLineTypeCustomDash color:[UIColor orangeColor] position:BMLinePostionCustomRight];
    
    [_downVIew addLineWithType:BMLineTypeCustomDot color:nil position:BMLinePostionCustomTop];
    [_downVIew addLineWithType:BMLineTypeCustomDot color:[UIColor redColor] position:BMLinePostionCustomCenterX];
    [_downVIew addLineWithType:BMLineTypeCustomDot color:[UIColor blueColor] position:BMLinePostionCustomBottom];
    [_downVIew addLineWithType:BMLineTypeCustomDot color:[UIColor yellowColor] position:BMLinePostionCustomLeft];
    [_downVIew addLineWithType:BMLineTypeCustomDot color:[UIColor blackColor] position:BMLinePostionCustomCenterY];
    [_downVIew addLineWithType:BMLineTypeCustomDot color:[UIColor orangeColor] position:BMLinePostionCustomRight];
    
    [_mid2VIew addLineWithType:BMLineTypeCustomTriangle color:[UIColor redColor] position:BMLinePostionCustomCenterX];
    [_mid2VIew addLineWithType:BMLineTypeCustomTriangle color:[UIColor blackColor] position:BMLinePostionCustomCenterY];
    [_mid2VIew addLineWithType:BMDashLineWidth color:[UIColor blueColor] position:BMLinePostionCustomAll];
}

-(void)btnAction:(id)sender
{
    UIButton *btn=sender;
    switch (btn.tag) {
        case 1:
        {
            [_mid2VIew removeAllLines];
        }
            break;
        case 2:
        {
            [_midVIew removeLineWithPosition:BMLinePostionCustomCenterY];
        }
            break;
        default:
            break;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
