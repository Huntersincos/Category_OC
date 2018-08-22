//
//  OtherHandelMethod.m
//  OC_Categroy
//
//  Created by wenze on 2018/3/28.
//  Copyright © 2018年 wenze. All rights reserved.
//

#import "OtherHandelMethod.h"
#import "InvocationModel.h"

@implementation OtherHandelMethod

// 重写methodSignatureForSelector方法 进行完整转发
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if ([NSStringFromSelector(aSelector) isEqualToString:@"redirectionMethod:"]) {
        NSMethodSignature *sign = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
        return sign;
    }
    return [super methodSignatureForSelector:aSelector];
    
}

// 消息完整转发给InvocationModel类 实现charge:方法
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    InvocationModel *model = [InvocationModel new];
    anInvocation.selector  = NSSelectorFromString(@"charge:");
    if ([model respondsToSelector:[anInvocation selector]]) {
        [anInvocation invokeWithTarget:model];
    }else{
        [super forwardInvocation:anInvocation];
    }
    
}

//- (void)redirectionMethod:(int)temp
//{
//    NSLog(@"实现RedirectionMessageMethod过来的方法redirectionMethod:");
//
//}

@end
