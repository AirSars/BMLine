//
//  BMLineType.m
//  BMLine
//
//  Created by NADA_BM on 15/10/21.
//  Copyright © 2015年 NADA_BM. All rights reserved.
//

#import "BMLineCumstomDefault.h"

@implementation BMLineCumstomDefault

-(void)drawRect:(CGRect)rect
{
    
}

@end


@implementation BMLineCumstomDash

-(void)drawRect:(CGRect)rect
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:self.frame];
    [shapeLayer setPosition:self.center];
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    // 设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:self.color.CGColor];
    // 3.0f设置虚线的宽度
    [shapeLayer setLineWidth:BMDashLineWidth];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    // 3=线的宽度 1=每条线的间距
    [shapeLayer setLineDashPattern:
     [NSArray arrayWithObjects:[NSNumber numberWithInt:BMDashLineLength],
      [NSNumber numberWithInt:1],nil]];
    
    // Setup the path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0,0);
    CGPathAddLineToPoint(path, NULL, BMFrameWidth,BMFrameHeight);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    [self.layer addSublayer:shapeLayer];
    
    //    CGContextRef context = UIGraphicsGetCurrentContext();
    //    CGContextSetLineWidth(context, BMDashLineWidth);
    //    CGContextSetStrokeColorWithColor(context, self.color.CGColor);
    //    CGFloat lengths[] = {BMDashLineLength};
    //    CGContextSetLineDash(context, 0, lengths, 1);
    //    CGContextMoveToPoint(context, 0, 0);
    //    CGContextAddLineToPoint(context, BMFrameWidth,BMFrameHeight);
    //    CGContextStrokePath(context);
}
@end


@implementation BMLineCumstomDot

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.color.CGColor);
    if (BMFrameWidth>10) {
        for (float i=BMDotLineRadius; i<BMFrameWidth; i+=4*BMDotLineRadius) {
            CGContextAddArc(context, i, BMDotLineRadius, BMDotLineRadius, 0, 2*M_PI, 0);
            CGContextDrawPath(context, kCGPathFill);
        }
    }else{
        for (float i=BMDotLineRadius; i<BMFrameHeight; i+=4*BMDotLineRadius) {
            CGContextAddArc(context, BMDotLineRadius, i, BMDotLineRadius, 0, 2*M_PI, 0);
            CGContextDrawPath(context, kCGPathFill);
        }
    }
}

@end


@implementation BMLineCumstomTriangle

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, self.color.CGColor);
    CGFloat height=sqrtf(3)*BMTriangleLength/2;
    if (BMFrameWidth>10) {
        for (float i=0.0; i<BMFrameWidth; i+=2*BMTriangleLength) {
            CGPoint sPoints[3];
            sPoints[0] =CGPointMake(i, BMFrameHeight);
            sPoints[1] =CGPointMake(i+BMTriangleLength/2,height);
            sPoints[2] =CGPointMake(i+BMTriangleLength, BMFrameHeight);
            CGContextAddLines(context, sPoints, 3);
            CGContextClosePath(context);
            CGContextDrawPath(context, kCGPathFillStroke);
        }
    }else{
        for (float i=0.0; i<BMFrameHeight; i+=2*BMTriangleLength) {
            CGPoint sPoints[3];
            sPoints[0] =CGPointMake(0,i);
            sPoints[1] =CGPointMake(height,i+BMTriangleLength/2);
            sPoints[2] =CGPointMake(0, i+BMTriangleLength);
            CGContextAddLines(context, sPoints, 3);
            CGContextClosePath(context);
            CGContextDrawPath(context, kCGPathFillStroke);
        }
    }
}

@end


