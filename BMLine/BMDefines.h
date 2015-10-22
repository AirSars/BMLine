//
//  Defines.h
//  BMLine
//
//  Created by NADA_BM on 15/10/21.
//  Copyright © 2015年 NADA_BM. All rights reserved.
//

#ifndef Defines_h
#define Defines_h

//=================可自定义区域===============//

//默认背景颜色
#define bgColor [UIColor lightGrayColor]

//默认直线线宽
static CGFloat const BMDefaultLineWidth=0.5;

//默认虚线线粗
static CGFloat const BMDashLineWidth=1;
//默认虚线线长度
static CGFloat const BMDashLineLength=2;

//默认小圆点半径
static CGFloat const BMDotLineRadius=1;

//默认小三角边长
static CGFloat const BMTriangleLength=2;

//==========================================//


//直线，虚线，小圆点，小三角
typedef NS_ENUM(NSUInteger,BMLineTypeCustom) {
    BMLineTypeCustomDefault,
    BMLineTypeCustomDash,
    BMLineTypeCustomDot,
    BMLineTypeCustomTriangle
};

//上，水平中，下，右，垂直中，左，四周四条边
typedef NS_ENUM(NSUInteger,BMLinePostionCustom) {
    BMLinePostionCustomTop,
    BMLinePostionCustomCenterX,
    BMLinePostionCustomBottom,
    BMLinePostionCustomRight,
    BMLinePostionCustomCenterY,
    BMLinePostionCustomLeft,
    BMLinePostionCustomAll
};

static void *kBMLineStoreKey = @"kBMLineStoreKey";

//父VIEW的位置属性
#define BMFrameX self.frame.origin.x
#define BMFrameY self.frame.origin.y
#define BMFrameWidth self.frame.size.width
#define BMFrameHeight self.frame.size.height

#endif /* Defines_h */
