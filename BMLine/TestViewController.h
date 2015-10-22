//
//  TestViewController.h
//  BMLine
//
//  Created by NADA_BM on 15/10/21.
//  Copyright © 2015年 NADA_BM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController

@property (weak,nonatomic) IBOutlet UIView *upVIew;
@property (weak,nonatomic) IBOutlet UIView *midVIew;
@property (weak,nonatomic) IBOutlet UIView *mid2VIew;
@property (weak,nonatomic) IBOutlet UIView *downVIew;


-(IBAction)btnAction:(id)sender;

@end
