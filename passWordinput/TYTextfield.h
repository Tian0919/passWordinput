//
//  TYTextfield.h
//  passWordinput
//
//  Created by 919fufu on 2018/4/25.
//  Copyright © 2018年 TMD. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TYTextfield;
@protocol textBackWardDelegate<NSObject>

-(void)delegateBack:(TYTextfield *)tf;

@end

@interface TYTextfield : UITextField
@property (assign,nonatomic)id<textBackWardDelegate>tydelegate;
@end
