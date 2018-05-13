//
//  ViewController.m
//  passWordinput
//
//  Created by 919fufu on 2018/4/25.
//  Copyright © 2018年 TMD. All rights reserved.
//

#import "ViewController.h"
#import "TYTextfield.h"
@interface ViewController ()<UITextFieldDelegate,UIAlertViewDelegate,textBackWardDelegate>
@property (nonatomic, strong) NSMutableArray *pwdArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pwdArr = [@[]mutableCopy];
    
    
    for (NSInteger i = 0; i < 6; i++) {
        TYTextfield * tf = [[TYTextfield alloc]initWithFrame:CGRectMake(10+i*40, 120, 40, 40)];
        tf.textAlignment = NSTextAlignmentCenter;
        tf.textColor = [UIColor blackColor];
        tf.borderStyle = UITextBorderStyleLine;
        tf.layer.borderWidth = 1;
        tf.layer.borderColor = [UIColor greenColor].CGColor;
        tf.text = @"";
        tf.tag = 100+i;
        tf.secureTextEntry = YES;
        tf.tintColor = [UIColor blackColor];//修改光标颜色
        
        [self.view addSubview:tf];
        tf.delegate = self;
        tf.tydelegate = self;
        if (i == 0) {
            [tf becomeFirstResponder];
        }
        [_pwdArr addObject:tf];
    }
    UIView *markView = [[UIView alloc]
                        initWithFrame:CGRectMake(0, 120, self.view.frame.size.width, 44)];
    [self.view addSubview:markView];
    markView.userInteractionEnabled = NO;
}
- (void)delegateBack:(TYTextfield *)tf{
    
    if (tf.tag >[[_pwdArr firstObject] tag]) {
        UITextField * tt = [(UITextField *)self.view viewWithTag:tf.tag -1];
        tt.text = @"";
        [tt becomeFirstResponder];
    }
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
   
    textField.text = string;
    if (textField.text.length > 0) {
        if (textField.tag < [[_pwdArr lastObject] tag]) {
            UITextField *tt = [(UITextField *)self.view viewWithTag:textField.tag +1];
            [tt becomeFirstResponder];
        }else if (textField.tag == [[_pwdArr lastObject] tag]){
//            NSLog(@"密码错误");
            [textField endEditing:YES];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"密码不正确" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil ];
            [alert show];
        }
    }
    return NO;
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    for (UITextField *tf in _pwdArr) {
        if (tf) {
            if (tf.tag == [[_pwdArr firstObject] tag]) {
                [tf becomeFirstResponder];
            }
            tf .text = @"";
        }
    }
    
}
@end
