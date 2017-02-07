//
//  ViewController.m
//  Measure
//
//  Created by Mitstuya.WATANABE on 2016/05/26.
//  Copyright © 2016年 Mitstuya.WATANABE. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *frontImageView;
@property (weak, nonatomic) IBOutlet UIImageView *sideImageView;
@property (weak, nonatomic) IBOutlet CustomView *boundingBoxView;
@property (assign, nonatomic) DrawType type;
@property (assign, nonatomic) float displayWidth;
@property (assign, nonatomic) float displayHeight;
@property (assign, nonatomic) CGPoint line1Pos;
@property (assign, nonatomic) CGPoint line2Pos;
@property (assign, nonatomic) CGPoint quadLeftEdgePos;
@property (assign, nonatomic) CGPoint quadRightEdgePos;
@property (weak, nonatomic) IBOutlet UILabel *sumLabel;
@property (weak, nonatomic) IBOutlet UILabel *sideSumLabel;
@property (weak, nonatomic) IBOutlet UILabel *peripherySumLabel;

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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.type = DrawTypeLine1;
    // display size (mm)
    // @see http://imoz.jp/cheatsheet/length_resolution.html
    _displayWidth = 50.0;
    _displayHeight = 89.0;
    _line1Pos = CGPointMake(0.0, 100.0);
    _line2Pos = CGPointMake(0.0, 100.0);
    _quadLeftEdgePos = CGPointMake(0.0, 0.0);
    _quadRightEdgePos = CGPointMake(100.0, 100.0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.view];
    
//    NSLog(@"location.y = %f", location.y);
    if (_type == DrawTypeLine1) _line1Pos = location;
    else if(_type == DrawTypeLine2) _line2Pos = location;
    
    
    if (self.type == DrawTypeLine1) self.line1Pos = location;
    else if (self.type == DrawTypeLine2) self.line2Pos = location;
    else if (self.type == DrawTypeSideLine1) self.sideLine1Pos = location;
    else if (self.type == DrawTypeSideLine2) self.sideLine2Pos = location;
    
    else if (self.type == DrawTypePhoneLine1) self.phoneLine1Pos = location;
    else if (self.type == DrawTypePhoneLine2) self.phoneLine2Pos = location;
    else if (self.type == DrawTypePhoneSideLine1) self.phoneSideLine1Pos = location;
    else if (self.type == DrawTypePhoneSideLine2) self.phoneSideLine2Pos = location;
    [_boundingBoxView move:location type:self.type];
    [_boundingBoxView setNeedsDisplay];
    [self calculate];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)calculate {
    float frontSize = [self sum:0];
    float sideSize = [self sum:1];
    float peripherySize = 0.0;
    
    _sumLabel.text = [NSString stringWithFormat:@"%.2f", frontSize];
    _sideSumLabel.text = [NSString stringWithFormat:@"%.2f", sideSize];
    
    // NOTE: 外周を計算する
    
    
//    _peripherySumLabel.text = [NSString stringWithFormat:@"%.2f", [self sum:2]];
}

- (IBAction)tappedButton:(UIButton *)sender {
    if (sender.tag == 100) self.type = DrawTypeLine1;
    else if (sender.tag == 101) self.type = DrawTypeLine2;
    else if (sender.tag == 102) self.type = DrawTypePhoneLine1;
    else if (sender.tag == 103) self.type = DrawTypePhoneLine2;
    
    else if (sender.tag == 104) self.type = DrawTypeSideLine1;
    else if (sender.tag == 105) self.type = DrawTypeSideLine2;
    else if (sender.tag == 106) self.type = DrawTypePhoneSideLine1;
    else if (sender.tag == 107) self.type = DrawTypePhoneSideLine2;
}

- (float)sum:(int)direction  {
    float pos1 = direction == 0 ? _boundingBoxView.line1Pos.x : _boundingBoxView.sideLine1Pos.x;
    float pos2 = direction == 0 ? _boundingBoxView.line2Pos.x : _boundingBoxView.sideLine2Pos.x;
    float phone1 = direction == 0 ? _boundingBoxView.phoneLine1Pos.y : _boundingBoxView.phoneSideLine1Pos.y;
    float phone2 = direction == 0 ? _boundingBoxView.phoneLine2Pos.y : _boundingBoxView.phoneSideLine2Pos.y;
    float scale = [[UIScreen mainScreen] scale];
//    // ピクセル数を取得
//    float height = [[UIScreen mainScreen] bounds].size.height * scale;
    // ピクセル数を取得
    float width = [[UIScreen mainScreen] bounds].size.width * scale;
    float phoneDistance = fabs((phone2 * scale - phone1 * scale));
    // 1ピクセルあたりのミリ
    float milli = _displayWidth / width;
    float milliWidth = _displayWidth * phoneDistance / width;
    // 実際のディスプレイサイズ(mm)と撮影した画像のディスプレイサイズ(mm)の比率を出す
    float ratio = _displayWidth / milliWidth;
    
    // 測定距離
    float distance = fabs(pos2 * scale - pos1 * scale);

    // 実寸の比率に換算した計算結果を返す
    return distance * milli * ratio;
}

@end
