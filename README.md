# Category_OC
一 简介:
        Category为现有的类提供了拓展性,它是category_t的结构体指针,category_t属于runtime技术范畴,Category也是runtime术语之一,category存储了类别中可以拓展的实例方法,类方法,协议,实例属性和类属性(无法添加实例变量),类属性是新增的特性,category_t有些成员变量是为了兼容Swift的特性,OC暂没有提供接口,仅做了底层数据结构兼容.
     
   ```
   typedef struct category_t {
    const char *name; // 类名
    classref_t cls;   // 类
    struct method_list_t *instanceMethods; // 实例方法列表
    struct method_list_t *classMethods; // 类方法列表
    struct protocol_list_t *protocols;  // 协议列表
    struct property_list_t *instanceProperties;  //实例属性列表
    struct property_list_t *_classProperties; // 类属性 2016新增的
    method_list_t *methodsForMeta(bool isMeta) {
        if (isMeta) return classMethods;
        else return instanceMethods;
     }
    property_list_t *propertiesForMeta(bool isMeta, struct  header_info *hi);
   
} category_t;

二 代码实践:

NSObject+YHXX_Category.h
```
#import <Foundation/Foundation.h>

@interface YHXX_Category:NSObject
- (void)yhxxName;
@end

@interface NSObject (YHXX_Category)
@property(nonatomic,copy)NSString *tokenName;
- (void)yhxxName;
@end
```
NSObject+YHXX_Category.m
```
#import "NSObject+YHXX_Category.h"

@implementation YHXX_Category
- (void)yhxxName
{
    NSLog(@"YHXX_Category");
    
}
@end

@implementation NSObject (YHXX_Category)
- (void)yhxxName
{
    
    NSLog(@"YHXX_Category");
}
@end
```

使用clang命令:
```
clang -rewrite-objc NSObject+YHXX_Category.m
```
在文件目录下生产一个NSObject+YHXX_Category.cpp文件,这个文件中将近10wan行代码,忽略无关紧要代码,可以找到如下代码片段:
```
static struct /*_method_list_t*/ {
	unsigned int entsize;  // sizeof(struct _objc_method)
	unsigned int method_count;
	struct _objc_method method_list[1];
} _OBJC_$_INSTANCE_METHODS_YHXX_Category __attribute__ ((used, section ("__DATA,__objc_const"))) = {
	sizeof(_objc_method),
	1,
	{{(struct objc_selector *)"yhxxName", "v16@0:8", (void *)_I_YHXX_Category_yhxxName}}
};

static struct _class_ro_t _OBJC_METACLASS_RO_$_YHXX_Category __attribute__ ((used, section ("__DATA,__objc_const"))) = {
	1, sizeof(struct _class_t), sizeof(struct _class_t), 
	(unsigned int)0, 
	0, 
	"YHXX_Category",
	0, 
	0, 
	0, 
	0, 
	0, 
};

static struct _class_ro_t _OBJC_CLASS_RO_$_YHXX_Category __attribute__ ((used, section ("__DATA,__objc_const"))) = {
	0, sizeof(struct YHXX_Category_IMPL), sizeof(struct YHXX_Category_IMPL), 
	(unsigned int)0, 
	0, 
	"YHXX_Category",
	(const struct _method_list_t *)&_OBJC_$_INSTANCE_METHODS_YHXX_Category,
	0, 
	0, 
	0, 
	0, 
};

extern "C" __declspec(dllimport) struct _class_t OBJC_METACLASS_$_NSObject;

extern "C" __declspec(dllexport) struct _class_t OBJC_METACLASS_$_YHXX_Category __attribute__ ((used, section ("__DATA,__objc_data"))) = {
	0, // &OBJC_METACLASS_$_NSObject,
	0, // &OBJC_METACLASS_$_NSObject,
	0, // (void *)&_objc_empty_cache,
	0, // unused, was (void *)&_objc_empty_vtable,
	&_OBJC_METACLASS_RO_$_YHXX_Category,
};

extern "C" __declspec(dllimport) struct _class_t OBJC_CLASS_$_NSObject;

extern "C" __declspec(dllexport) struct _class_t OBJC_CLASS_$_YHXX_Category __attribute__ ((used, section ("__DATA,__objc_data"))) = {
	0, // &OBJC_METACLASS_$_YHXX_Category,
	0, // &OBJC_CLASS_$_NSObject,
	0, // (void *)&_objc_empty_cache,
	0, // unused, was (void *)&_objc_empty_vtable,
	&_OBJC_CLASS_RO_$_YHXX_Category,
};
static void OBJC_CLASS_SETUP_$_YHXX_Category(void ) {
	OBJC_METACLASS_$_YHXX_Category.isa = &OBJC_METACLASS_$_NSObject;
	OBJC_METACLASS_$_YHXX_Category.superclass = &OBJC_METACLASS_$_NSObject;
	OBJC_METACLASS_$_YHXX_Category.cache = &_objc_empty_cache;
	OBJC_CLASS_$_YHXX_Category.isa = &OBJC_METACLASS_$_YHXX_Category;
	OBJC_CLASS_$_YHXX_Category.superclass = &OBJC_CLASS_$_NSObject;
	OBJC_CLASS_$_YHXX_Category.cache = &_objc_empty_cache;
}
#pragma section(".objc_inithooks$B", long, read, write)
__declspec(allocate(".objc_inithooks$B")) static void *OBJC_CLASS_SETUP[] = {
	(void *)&OBJC_CLASS_SETUP_$_YHXX_Category,
};

//实例方法列表,命名方式遵循公共前缀+类目+category名字的命名方式
static struct /*_method_list_t*/ {
	unsigned int entsize;  // sizeof(struct _objc_method)
	unsigned int method_count;
	struct _objc_method method_list[1];
} _OBJC_$_CATEGORY_INSTANCE_METHODS_NSObject_$_YHXX_Category __attribute__ ((used, section ("__DATA,__objc_const"))) = {
	sizeof(_objc_method),
	1,
	{{(struct objc_selector *)"yhxxName", "v16@0:8", (void *)_I_NSObject_YHXX_Category_yhxxName}}
};

// 属性列表 命名方式遵循公共前缀+类目+category名字的命名方式
static struct /*_prop_list_t*/ {
	unsigned int entsize;  // sizeof(struct _prop_t)
	unsigned int count_of_properties;
	struct _prop_t prop_list[1];
} _OBJC_$_PROP_LIST_NSObject_$_YHXX_Category __attribute__ ((used, section ("__DATA,__objc_const"))) = {
	sizeof(_prop_t),
	1,
	{{"tokenName","T@\"NSString\",C,N"}}
};

extern "C" __declspec(dllimport) struct _class_t OBJC_CLASS_$_NSObject;

static struct _category_t _OBJC_$_CATEGORY_NSObject_$_YHXX_Category __attribute__ ((used, section ("__DATA,__objc_const"))) = 
{
	"NSObject",
	0, // &OBJC_CLASS_$_NSObject,
	(const struct _method_list_t *)&_OBJC_$_CATEGORY_INSTANCE_METHODS_NSObject_$_YHXX_Category,
	0,
	0,
	(const struct _prop_list_t *)&_OBJC_$_PROP_LIST_NSObject_$_YHXX_Category,
};
static void OBJC_CATEGORY_SETUP_$_NSObject_$_YHXX_Category(void ) {
	_OBJC_$_CATEGORY_NSObject_$_YHXX_Category.cls = &OBJC_CLASS_$_NSObject;
}
#pragma section(".objc_inithooks$B", long, read, write)
__declspec(allocate(".objc_inithooks$B")) static void *OBJC_CATEGORY_SETUP[] = {
	(void *)&OBJC_CATEGORY_SETUP_$_NSObject_$_YHXX_Category,
};
static struct _class_t *L_OBJC_LABEL_CLASS_$ [1] __attribute__((used, section ("__DATA, __objc_classlist,regular,no_dead_strip")))= {
	&OBJC_CLASS_$_YHXX_Category,
};
static struct _category_t *L_OBJC_LABEL_CATEGORY_$ [1] __attribute__((used, section ("__DATA, __objc_catlist,regular,no_dead_strip")))= {
	&_OBJC_$_CATEGORY_NSObject_$_YHXX_Category,
};
```
三 Category 如何加载
   在App启动加载镜像文件时,会在```read_images```函数间接调用```attachCategories```函数,完成对类中添加``` Category```的工作,原理就是向```class_rw_t```中的```method_array_t```,```property_array_t```,```protocol_list_t```数组中添加```mehtod_list_t```,```property_list_t```,```protocol_list_t```指针,源码在```objc-runtime-new.mm```中

  注意:category的方法没有"完全替换掉"原来的类已有的方法,也就是说如果类目中新增的一个方法和原类中方法一样时,类的方法列表会出现两个相同的方法,虽然没有替换掉但是可以覆盖掉同名方法,这是因为运行时查找方法是按照顺序来查找的(已有类的方法在方法列表后面),只有查找到对应的名字方法,就会停止加载.

四 category关联对象
  我们知道在category是无法添加实例变量的,但是我们可以给category中添加和对象关联的值
   ```
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
```
在```objc-references.mm```文件中有个方法```_object_set_associative_reference:```中可以看到category的所有关联对象都由```AssociationsManager```管理
```AssociationsManager```里面是由一个静态```AssociationsHashMap```来存储所有的关联对象的。Category的关联对象都存在一个全局```map```里面。而```map```的```key```是这个对象的指针地址，而```map```的```value```又是另外一个```AssociationsHashMap```，里面保存了关联对象的```kv```对。
关联对象是否被销毁是通过函数```objc_destructInstance```判断对象是否关联对象,如果有会调用```_object_remove_assocations```将其销毁.



后记 因本人能力有限,可能有描述不对地方,还望批评指正!!!

参考文献:http://yulingtianxia.com/blog/2014/11/05/objective-c-runtime/
demo:https://github.com/joinGitWenze/Category_OC




