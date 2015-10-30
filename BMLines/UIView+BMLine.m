//
//  BMLine.m
//  BMLine
//
//  Created by NADA_BM on 15/10/21.
//  Copyright © 2015年 NADA_BM. All rights reserved.
//

#import "UIView+BMLine.h"
#import <objc/runtime.h>
#import <QuartzCore/QuartzCore.h>

@implementation UIView (BMLine)

//利用类族，将具体的实现放在各自的子类中
-(void)addLineWithType:(BMLineTypeCustom)type color:(UIColor *)color position:(BMLinePostionCustom)position
{
    switch (type) {
        case BMLineTypeCustomDefault:
        {
            //判断此View上的这个位置是否已经存在线，如果存在则覆盖
            NSMutableDictionary *dic=[objc_getAssociatedObject(self, kBMLineStoreKey) mutableCopy];
            if ([dic objectForKey:[NSString stringWithFormat:@"%ld",position]]) {
                [self removeLineWithPosition:position];
            }
            if (position==BMLinePostionCustomAll) {
                [self addLineAll:type color:color];
                return;
            }
            BMLineCumstomDefault *line=[[BMLineCumstomDefault alloc]init];
            //具体位置的实现统一放入另一个方法
            [self lineWithPositionAndColor:line position:position width:BMDefaultLineWidth];
            if (color) {
                line.backgroundColor=color;
            }else{
                line.backgroundColor=bgColor;
            }
            //将对象关联到此View
            if (!dic) {
                dic=@{}.mutableCopy;
            }
            [dic setObject:line forKey:[NSString stringWithFormat:@"%ld",position]];
            objc_setAssociatedObject(self, kBMLineStoreKey, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            [self addSubview:line];
        }
            break;
        case BMLineTypeCustomDash:
        {
            NSMutableDictionary *dic=[objc_getAssociatedObject(self, kBMLineStoreKey) mutableCopy];
            if ([dic objectForKey:[NSString stringWithFormat:@"%ld",position]]) {
                [self removeLineWithPosition:position];
            }
            if (position==BMLinePostionCustomAll) {
                [self addLineAll:type color:color];
                return;
            }
            BMLineCumstomDash *line=[[BMLineCumstomDash alloc]init];
            line.backgroundColor=[UIColor clearColor];
            if (color) {
                line.color=color;
            }else{
                line.color=bgColor;
            }
            [self lineWithPositionAndColor:line position:position width:BMDashLineWidth];
            if (!dic) {
                dic=@{}.mutableCopy;
            }
            [dic setObject:line forKey:[NSString stringWithFormat:@"%ld",position]];
            objc_setAssociatedObject(self, kBMLineStoreKey, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            [self addSubview:line];
        }
            break;
        case BMLineTypeCustomDot:
        {
            NSMutableDictionary *dic=[objc_getAssociatedObject(self, kBMLineStoreKey) mutableCopy];
            if ([dic objectForKey:[NSString stringWithFormat:@"%ld",position]]) {
                [self removeLineWithPosition:position];
            }
            if (position==BMLinePostionCustomAll) {
                [self addLineAll:type color:color];
                return;
            }
            BMLineCumstomDot *line=[[BMLineCumstomDot alloc]init];
            line.backgroundColor=[UIColor clearColor];
            if (color) {
                line.color=color;
            }else{
                line.color=bgColor;
            }
            [self lineWithPositionAndColor:line position:position width:2*BMDotLineRadius];
            if (!dic) {
                dic=@{}.mutableCopy;
            }
            [dic setObject:line forKey:[NSString stringWithFormat:@"%ld",position]];
            objc_setAssociatedObject(self, kBMLineStoreKey, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            [self addSubview:line];
        }
            break;
        case BMLineTypeCustomTriangle:
        {
            NSMutableDictionary *dic=[objc_getAssociatedObject(self, kBMLineStoreKey) mutableCopy];
            if ([dic objectForKey:[NSString stringWithFormat:@"%ld",position]]) {
                [self removeLineWithPosition:position];
            }
            if (position==BMLinePostionCustomAll) {
                [self addLineAll:type color:color];
                return;
            }
            BMLineCumstomTriangle *line=[[BMLineCumstomTriangle alloc]init];
            line.backgroundColor=[UIColor clearColor];
            if (color) {
                line.color=color;
            }else{
                line.color=bgColor;
            }
            [self lineWithPositionAndColor:line position:position width:sqrtf(3)*BMTriangleLength/2+1];
            if (!dic) {
                dic=@{}.mutableCopy;
            }
            [dic setObject:line forKey:[NSString stringWithFormat:@"%ld",position]];
            objc_setAssociatedObject(self, kBMLineStoreKey, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            [self addSubview:line];
        }
            break;
        default:
            break;
    }
}

-(void)lineWithPositionAndColor:(UIView *)line position:(BMLinePostionCustom)position width:(CGFloat)lineWidth
{
    switch (position) {
        case BMLinePostionCustomTop:
        {
            line.frame=CGRectMake(0,0, BMFrameWidth, lineWidth);
        }
            break;
        case BMLinePostionCustomCenterX:
        {
            line.frame=CGRectMake(0,BMFrameHeight/2, BMFrameWidth, lineWidth);
        }
            break;
        case BMLinePostionCustomBottom:
        {
            line.frame=CGRectMake(0,BMFrameHeight-lineWidth, BMFrameWidth, lineWidth);
        }
            break;
        case BMLinePostionCustomLeft:
        {
            line.frame=CGRectMake(0, 0, lineWidth, BMFrameHeight);
        }
            break;
        case BMLinePostionCustomCenterY:
        {
            line.frame=CGRectMake(BMFrameWidth/2, 0, lineWidth, BMFrameHeight);
        }
            break;
        case BMLinePostionCustomRight:
        {
            line.frame=CGRectMake(BMFrameWidth-lineWidth, 0, lineWidth, BMFrameHeight);
        }
            break;
        default:
            break;
    }
}

-(void)addLineAll:(BMLineTypeCustom)type color:(UIColor *)color
{
    [self addLineWithType:type color:color position:BMLinePostionCustomTop];
    [self addLineWithType:type color:color position:BMLinePostionCustomRight];
    [self addLineWithType:type color:color position:BMLinePostionCustomBottom];
    [self addLineWithType:type color:color position:BMLinePostionCustomLeft];
}

-(void)removeLineWithPosition:(BMLinePostionCustom)position
{
    NSMutableDictionary *dic=[objc_getAssociatedObject(self, kBMLineStoreKey) mutableCopy];
    if (!dic) {
        return;
    }
    NSString *dicKey=[NSString stringWithFormat:@"%ld",position];
    UIView *view=[dic objectForKey:dicKey];
    if (!view) {
        return;
    }
    [view removeFromSuperview];
    [dic removeObjectForKey:dicKey];
    objc_setAssociatedObject(self, kBMLineStoreKey, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)removeAllLines
{
    NSMutableDictionary *dic=[objc_getAssociatedObject(self, kBMLineStoreKey) mutableCopy];
    if (!dic) {
        return;
    }
    if (dic.count>0) {
        for (UIView *view in [dic allValues]) {
            [view removeFromSuperview];
        }
        [dic removeAllObjects];
    }
    objc_setAssociatedObject(self, kBMLineStoreKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return;
}

@end
