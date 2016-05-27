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
}

- (void)drawLine:(DrawType)type {
    CGPoint pos;
    if (type == DrawTypeLine1) pos = self.line1Pos;
    else if (type == DrawTypeLine2) pos = self.line2Pos;
    
    UIBezierPath *line = [UIBezierPath bezierPath];
    // 起点
    [line moveToPoint:CGPointMake(0, pos.y)];
    
    // 帰着点
    [line addLineToPoint:CGPointMake(500, pos.y)];
    
    // 色の設定
    [[UIColor redColor] setStroke];
    // ライン幅
    line.lineWidth = 2;
    // 描画
    [line stroke];

}

- (void)move:(float)xPos yPos:(float)yPos type:(DrawType)type {
    self.x = xPos;
    self.y = yPos;
}

- (void)move:(CGPoint)pos type:(DrawType)type {
    NSLog(@"type = %ld", (long)type);
    if (type == DrawTypeLine1) self.line1Pos = pos;
    else if (type == DrawTypeLine2) self.line2Pos = pos;
    else if (type == DrawTypeQuad) self.quadPos = pos;
}
@end
