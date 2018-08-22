//
//  NSObject+YHXX_Category.m
//  OC_Categroy
//
//  Created by wenze on 2018/3/19.
//  Copyright © 2018年 wenze. All rights reserved.
//

#import "NSObject+YHXX_Category.h"
#import <objc/runtime.h>

@implementation NSObject (YHXX_Category)

- (void)setTokenName:(NSString *)tokenName
{
    objc_setAssociatedObject(self, @"category", tokenName, OBJC_ASSOCIATION_COPY);
}

- (NSString *)tokenName
{
    return objc_getAssociatedObject(self, @"category");
    
}

@end
