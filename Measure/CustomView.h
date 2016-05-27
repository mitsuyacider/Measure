//
//  CustomImageView.h
//  Measure
//
//  Created by Mitstuya.WATANABE on 2016/05/26.
//  Copyright © 2016年 Mitstuya.WATANABE. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DrawType) {
    DrawTypeLine1, // default
    DrawTypeLine2,
    DrawTypeQuad
};

@interface CustomView : UIView

@property (nonatomic, assign) float width;
@property (nonatomic, assign) float height;
@property (nonatomic, assign) float x;
@property (nonatomic, assign) float y;
@property (nonatomic, assign) CGPoint line1Pos;
@property (nonatomic, assign) CGPoint line2Pos;
@property (nonatomic, assign) CGPoint quadPos;


- (void)move:(float)xPos yPos:(float)yPos type:(DrawType)type;
- (void)move:(CGPoint)pos type:(DrawType)type;
@end
