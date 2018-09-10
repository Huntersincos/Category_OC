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
