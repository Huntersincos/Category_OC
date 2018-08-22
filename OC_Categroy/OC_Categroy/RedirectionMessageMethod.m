//
//  RedirectionMessageMethod.m
//  OC_Categroy
//
//  Created by wenze on 2018/3/28.
//  Copyright © 2018年 wenze. All rights reserved.
//

#import "RedirectionMessageMethod.h"
#import "OtherHandelMethod.h"

@implementation RedirectionMessageMethod
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if ([NSStringFromSelector(aSelector) isEqualToString:@"redirectionMethod:"]) {
        // 把这个方法转给OtherHandelMethodl类
        OtherHandelMethod *otherTar  = [OtherHandelMethod new];
        return otherTar;
    }
    return [super forwardingTargetForSelector:aSelector];
    
}

@end
