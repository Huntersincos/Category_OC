//
//  NSObject+YHXX_Category.h
//  OC_Categroy
//
//  Created by wenze on 2018/3/19.
//  Copyright © 2018年 wenze. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHXX_Category:NSObject
- (void)yhxxName;
@end

@interface NSObject (YHXX_Category)
@property(nonatomic,copy)NSString *tokenName;
- (void)yhxxName;

@end
