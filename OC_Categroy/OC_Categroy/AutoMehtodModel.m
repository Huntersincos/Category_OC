//
//  AutoMehtodModel.m
//  OC_Categroy
//
//  Created by wenze on 2018/3/27.
//  Copyright © 2018年 wenze. All rights reserved.
//

#import "AutoMehtodModel.h"
#import <objc/runtime.h>
@implementation AutoMehtodModel
@dynamic addAutoMethod;
/**
  为addAutoMethod动态添加set和get方法
 **/
 +(BOOL)resolveInstanceMethod:(SEL)sel
{
    NSString *addSelectorStr = NSStringFromSelector(sel);
    //v@:@是一种符合 涉及到https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
    if ([addSelectorStr isEqualToString:@"setAddAutoMethod:"]) {
        class_addMethod(self, sel, (IMP)autoSetter, "v@:@");
    }else if ([addSelectorStr isEqualToString:@"addAutoMethod"]){
        class_addMethod(self, sel, (IMP)autoGet, "@@:");
    }
    return [super resolveInstanceMethod:sel];
}

void autoSetter(id self,SEL _cmd, id value){
    NSLog(@"set方法 === %@",value);
    
}

id autoGet(id self,SEL _cmd){
    return @"get方法";
}

@end
