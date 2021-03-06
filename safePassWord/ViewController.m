//
//  LWPlaceHolderReplace.m
//  CodeView
//
//  Created by 李伟 on 16/11/14.

#import "LWPlaceHolderReplace.h"
#import "ViewController.h"
#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UITextFieldDelegate, LWPlaceHolderReplaceDelagate>

@property (nonatomic, strong) UITextField *tf;
@property (nonatomic, strong) UIView *point1;
@property (nonatomic, strong) UIView *point2;
@property (nonatomic, strong) UIView *point3;
@property (nonatomic, strong) UIView *point4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self lwPlaceHolder];
}

- (void)lwPlaceHolder {

    LWPlaceHolderReplace *placeView = [[LWPlaceHolderReplace alloc] initWithFrame:CGRectMake(20, 100, 150, 30)];
    placeView.delegate = self;
    placeView.center = self.view.center;
    [self.view addSubview:placeView];
}
- (void)lwValidteCodeDidInput:(LWPlaceHolderReplace *)codeView withCode:(NSString *)code {

    NSLog(@"<代理 >%@", code);
}
- (void)layoutSubview {

    //输入框
    _tf = [[UITextField alloc] initWithFrame:CGRectMake(KScreenW / 2 - 70, 100, 140, 30)];
    _tf.keyboardType = UIKeyboardTypeNumberPad;
    [_tf becomeFirstResponder];
    _tf.layer.borderColor = [UIColor redColor].CGColor;
    _tf.layer.borderWidth = 1.0;
    _tf.delegate = self;
    [self.view addSubview:_tf];

    //覆盖输入框
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(KScreenW / 2 - 70, 100, 140, 30)];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.borderColor = [UIColor purpleColor].CGColor;
    view.layer.borderWidth = 1.0;
    [self.view addSubview:view];

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

@end
