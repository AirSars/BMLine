//
//  BMLine.h
//  BMLine
//
//  Created by NADA_BM on 15/10/21.
//  Copyright © 2015年 NADA_BM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMLineCumstomDefault.h"
#import "BMDefines.h"

@interface UIView (BMLine)

/**
 *  生成线条
 *
 *  @param type     线条的样式
 *  @param color    线条的颜色，若为nil则默认颜色
 *  @param position 线条的位置
 */
-(void)addLineWithType:(BMLineTypeCustom)type color:(UIColor *)color position:(BMLinePostionCustom)position;

/**
 *  根据参数所给的位置信息删除相应的线
 *
 *  @param position 线所在的位置
 */
-(void)removeLineWithPosition:(BMLinePostionCustom)position;


/**
 *  删除此View上所有的BMLine
 */
-(void)removeAllLines;

@end
