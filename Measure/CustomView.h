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
    DrawTypeSideLine1,
    DrawTypeSideLine2,
    DrawTypePhoneLine1,
    DrawTypePhoneLine2,
    DrawTypePhoneSideLine1,
    DrawTypePhoneSideLine2
};

@interface CustomView : UIView

@property (nonatomic, assign) float width;
@property (nonatomic, assign) float height;
@property (nonatomic, assign) float x;
@property (nonatomic, assign) float y;
@property (nonatomic, assign) CGPoint line1Pos;
@property (nonatomic, assign) CGPoint line2Pos;
@property (nonatomic, assign) CGPoint sideLine1Pos;
@property (nonatomic, assign) CGPoint sideLine2Pos;
@property (nonatomic, assign) CGPoint leftEdgePos;
@property (nonatomic, assign) CGPoint rightEdgePos;
@property (nonatomic, assign) CGPoint leftSideEdgePos;
@property (nonatomic, assign) CGPoint rightSideEdgePos;
@property (nonatomic, assign) CGPoint phoneLine1Pos;
@property (nonatomic, assign) CGPoint phoneLine2Pos;
@property (nonatomic, assign) CGPoint phoneSideLine1Pos;
@property (nonatomic, assign) CGPoint phoneSideLine2Pos;


- (void)move:(CGPoint)pos type:(DrawType)type;
- (void)moveQuad:(CGPoint)pos endPos:(CGPoint)endPos type:(DrawType)type;
@end
