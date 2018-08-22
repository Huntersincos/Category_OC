//
//  ViewController.m
//  OC_Categroy
//
//  Created by wenze on 2018/3/19.
//  Copyright © 2018年 wenze. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "AutoMehtodModel.h"
#import "RedirectionMessageMethod.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    id LenderClass = objc_getClass("ViewController");
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(LenderClass, &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        fprintf(stdout, "%s %s\n", property_getName(property), property_getAttributes(property));
    }
    
    AutoMehtodModel *model = [[AutoMehtodModel alloc]init];
    model.addAutoMethod   = @"动态方法";
    NSLog(@"%@",model.addAutoMethod);
    
    RedirectionMessageMethod *method = [RedirectionMessageMethod new];
    [method redirectionMethod:100];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
