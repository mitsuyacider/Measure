//
//  CustomImageView.m
//  Measure
//
//  Created by Mitstuya.WATANABE on 2016/05/26.
//  Copyright © 2016年 Mitstuya.WATANABE. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
//        [self setup];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    [self drawLine:DrawTypeLine1];
    [self drawLine:DrawTypeLine2];
    [self drawLine:DrawTypeSideLine1];
    [self drawLine:DrawTypeSideLine2];
    [self drawLine:DrawTypePhoneLine1];
    [self drawLine:DrawTypePhoneLine2];
    [self drawLine:DrawTypePhoneSideLine1];
    [self drawLine:DrawTypePhoneSideLine2];
//    [self drawQuad:DrawTypeQuad];
}

- (void)drawLine:(DrawType)type {
    CGPoint pos;
    if (type == DrawTypeLine1) pos = self.line1Pos;
    else if (type == DrawTypeLine2) pos = self.line2Pos;
    else if (type == DrawTypeSideLine1) pos = self.sideLine1Pos;
    else if (type == DrawTypeSideLine2) pos = self.sideLine2Pos;
    
    else if (type == DrawTypePhoneLine1) pos = self.phoneLine1Pos;
    else if (type == DrawTypePhoneLine2) pos = self.phoneLine2Pos;
    else if (type == DrawTypePhoneSideLine1) pos = self.phoneSideLine1Pos;
    else if (type == DrawTypePhoneSideLine2) pos = self.phoneSideLine2Pos;

    
    UIBezierPath *line = [UIBezierPath bezierPath];
    float startX = 0.0;
    float startY = 0.0;
    float endX = 0.0;
    float endY = 0.0;
    
    if (type == DrawTypeLine1 || type == DrawTypeLine2) {
//        startY = pos.y;
//        endX = 138.0;
//        endY = pos.y;

        startX = pos.x;
        endX = pos.x;
        endY = 500.0;

        // 色の設定
        [[UIColor blueColor] setStroke];
        
    } else if (type == DrawTypeSideLine1 || type == DrawTypeSideLine2) {
        startX = pos.x;
        endX = pos.x;
        endY = 500.0;
        // 色の設定
        [[UIColor redColor] setStroke];        
    } else {
        if (type == DrawTypePhoneLine1 || type == DrawTypePhoneLine2) {
            startX = 0.0;
            startY = pos.y;
            endX = 138.0;
            endY = pos.y;
        } else if (type == DrawTypePhoneSideLine1 || type == DrawTypePhoneSideLine2) {
            startX = 154.0;
            startY = pos.y;
            endX = 282.0;
            endY = pos.y;
        }
        
        [[UIColor greenColor] setStroke];
    }
    
    // 起点
    [line moveToPoint:CGPointMake(startX, startY)];
    
    // 帰着点
    [line addLineToPoint:CGPointMake(endX, endY)];

    // ライン幅
    line.lineWidth = 1;
    // 描画
    [line stroke];
}

- (void)drawQuad:(DrawType)type {
//    CGPoint leftPos;
//    CGPoint rightPos;
//    if (type == DrawTypeQuad) {
//        leftPos = self.leftEdgePos;
//        rightPos = self.rightEdgePos;
//    } else if (type == DrawTypeSideQuad) {
//        leftPos = self.leftSideEdgePos;
//        rightPos = self.rightSideEdgePos;
//    }
//
////    CGContextRef context = UIGraphicsGetCurrentContext();
////    // 矩形を描画
////    CGContextSetRGBStrokeColor(context, 0.0f, 1.0f, 0.0f, 1.0f);
////    CGContextStrokeRect(context, CGRectMake(leftPos.x, leftPos.y, 50.0, 50.0));
//    
//    UIBezierPath *line = [UIBezierPath bezierPath];
//    [[UIColor greenColor] setStroke];
//    [line moveToPoint:CGPointMake(leftPos.x, leftPos.y)];
//    [line addLineToPoint:CGPointMake(rightPos.x, leftPos.y)];
//    [line addLineToPoint:CGPointMake(rightPos.x, rightPos.y)];
//    [line addLineToPoint:CGPointMake(leftPos.x, rightPos.y)];
//    
//    // ライン幅
//    line.lineWidth = 1;
//    // 描画
//    [line stroke];
}

- (void)move:(CGPoint)pos type:(DrawType)type {
    
    if (type == DrawTypeLine1) self.line1Pos = pos;
    else if (type == DrawTypeLine2) self.line2Pos = pos;
    else if (type == DrawTypeSideLine1) self.sideLine1Pos = pos;
    else if (type == DrawTypeSideLine2) self.sideLine2Pos = pos;
    
    else if (type == DrawTypePhoneLine1) self.phoneLine1Pos = pos;
    else if (type == DrawTypePhoneLine2) self.phoneLine2Pos = pos;
    else if (type == DrawTypePhoneSideLine1) self.phoneSideLine1Pos = pos;
    else if (type == DrawTypePhoneSideLine2) self.phoneSideLine2Pos = pos;
}

- (void)moveQuad:(CGPoint)pos endPos:(CGPoint)endPos type:(DrawType)type{
//    if (type == DrawTypeQuad) {
//        self.leftEdgePos = pos;
//        self.rightEdgePos = endPos;
//    } else if (type == DrawTypeSideQuad) {
//        self.leftSideEdgePos = pos;
//        self.rightSideEdgePos = endPos;
//    }
}

@end
