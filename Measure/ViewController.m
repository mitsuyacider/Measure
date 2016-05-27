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
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet CustomView *boundingBoxView;
@property (assign, nonatomic) DrawType type;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.type = DrawTypeLine1;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.boundingBoxView];
//    [_boundingBoxView move:location.x yPos:location.y type:self.type];
    [_boundingBoxView move:location type:self.type];
    [_boundingBoxView setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (IBAction)tappedButton:(UIButton *)sender {
    if (sender.tag == 100) self.type = DrawTypeLine1;
    else if (sender.tag == 101) self.type = DrawTypeLine2;
    else if (sender.tag == 102) self.type = DrawTypeQuad;
}

@end
