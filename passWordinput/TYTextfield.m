//
//  TYTextfield.m
//  passWordinput
//
//  Created by 919fufu on 2018/4/25.
//  Copyright © 2018年 TMD. All rights reserved.
//

#import "TYTextfield.h"

@implementation TYTextfield
//通过代理调用textfield内部的监听退格方法
- (void)deleteBackward{
    
    if ([self.tydelegate respondsToSelector:@selector(delegateBack:)]) {
        [self.tydelegate delegateBack:self];
    }
    
    
}

@end
