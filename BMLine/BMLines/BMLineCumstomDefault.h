//
//  BMLineType.h
//  BMLine
//
//  Created by NADA_BM on 15/10/21.
//  Copyright © 2015年 NADA_BM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BMDefines.h"

/**
 *  普通直线
 */
@interface BMLineCumstomDefault : UIView

@end

/**
 *  虚线
 */
@interface BMLineCumstomDash : UIView

@property(strong,nonatomic)UIColor *color;

@end

/**
 *  小圆点
 */
@interface BMLineCumstomDot : UIView

@property(strong,nonatomic)UIColor *color;

@end

/**
 *  小三角
 */
@interface BMLineCumstomTriangle : UIView

@property(strong,nonatomic)UIColor *color;

@end