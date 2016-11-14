//
//  LWPlaceHolderReplace.m
//  safePassWord
//
//  Created by 李伟 on 16/11/14.
//  Copyright © 2016年 googosoft. All rights reserved.
//
#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height
#import <UIKit/UIKit.h>
#import "LWPlaceHolderReplace.h"
@interface LWPlaceHolderReplace()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *tf;
@property (nonatomic, strong) UIView *point1;
@property (nonatomic, strong) UIView *point2;
@property (nonatomic, strong) UIView *point3;
@property (nonatomic, strong) UIView *point4;

@end
@implementation LWPlaceHolderReplace

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        //  to do
        
        [self layOutSubView];
    }
    
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{

    
    if (self = [super initWithCoder:aDecoder]) {
        // to do
        [self layOutSubView];
    }
    return self;
}
-(instancetype)init{

    if (self = [super init]) {
        // to do
        
        [self layOutSubView];
    }
    return self;
    
}
#pragma mark 布局
-(void)layOutSubView{

    NSLog(@"%@",NSStringFromCGRect(self.frame));
    _tf = [[UITextField alloc] initWithFrame:self.bounds];//CGRectMake(KScreenW / 2 - 70, 100, 140, 30)
    _tf.keyboardType = UIKeyboardTypeNumberPad;
    [_tf becomeFirstResponder];
    _tf.layer.borderColor = [UIColor redColor].CGColor;
    _tf.layer.borderWidth = 1.0;
    _tf.delegate = self;
    [self addSubview:_tf];
    
    //覆盖输入框
    UIView *view = [[UIView alloc] initWithFrame:_tf.frame];// CGRectMake(KScreenW / 2 - 70, 100, 140, 30)
    view.backgroundColor = [UIColor whiteColor];
    view.layer.borderColor = [UIColor purpleColor].CGColor;
    view.layer.borderWidth = 1.0;
    [self addSubview:view];
    
    for (int i = 0; i < 4; i++) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i * 20 + i * 20, _tf.frame.size.height / 2 - 1, 20, 2)];
        label.backgroundColor = [UIColor blackColor];
        [view addSubview:label];
    }
    
    //黑色圆点
    _point1 = [[UIView alloc] initWithFrame:CGRectMake(0, _tf.frame.size.height / 2 - 10, 20, 20)];
    _point1.backgroundColor = [UIColor blackColor];
    _point1.layer.cornerRadius = 10;
    _point1.hidden = YES;
    
    _point2 = [[UIView alloc] initWithFrame:CGRectMake(40, _tf.frame.size.height / 2 - 10, 20, 20)];
    _point2.backgroundColor = [UIColor blackColor];
    _point2.layer.cornerRadius = 10;
    _point2.hidden = YES;
    
    _point3 = [[UIView alloc] initWithFrame:CGRectMake(80, _tf.frame.size.height / 2 - 10, 20, 20)];
    _point3.backgroundColor = [UIColor blackColor];
    _point3.layer.cornerRadius = 10;
    _point3.hidden = YES;
    
    _point4 = [[UIView alloc] initWithFrame:CGRectMake(120, _tf.frame.size.height / 2 - 10, 20, 20)];
    _point4.backgroundColor = [UIColor blackColor];
    _point4.layer.cornerRadius = 10;
    _point4.hidden = YES;
    
    [view addSubview:_point1];
    [view addSubview:_point2];
    [view addSubview:_point3];
    [view addSubview:_point4];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(shoePoint)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:nil];
}
- (void)shoePoint {
    //
    //    if ([_tf.text length] >=5){
    //        [_tf resignFirstResponder];
    //        return;
    //    }
    if (_tf.text.length == 0) {
        _point1.hidden = YES;
        _point2.hidden = YES;
        _point3.hidden = YES;
        _point4.hidden = YES;
    }
    if (_tf.text.length == 1) {
        _point1.hidden = NO;
        _point2.hidden = YES;
        _point3.hidden = YES;
        _point4.hidden = YES;
    }
    if (_tf.text.length == 2) {
        _point1.hidden = NO;
        _point2.hidden = NO;
        _point3.hidden = YES;
        _point4.hidden = YES;
    }
    if (_tf.text.length == 3) {
        _point1.hidden = NO;
        _point2.hidden = NO;
        _point3.hidden = NO;
        _point4.hidden = YES;
    }
    if (_tf.text.length == 4) {
        _point1.hidden = NO;
        _point2.hidden = NO;
        _point3.hidden = NO;
        _point4.hidden = NO;
        [_tf resignFirstResponder];
    }
    
    NSLog(@"%@", _tf.text);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
