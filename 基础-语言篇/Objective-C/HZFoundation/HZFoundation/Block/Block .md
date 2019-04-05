### Block 
block是将函数及其执行上下文封装起来的对象；  
### Block语法  
^ 返回值 参数列表 表达式   

    ^ int (int a){
     return a + 2;
    };  
    
### Block 类型变量   
通过`typedef int(^blk_t)(int);`定义一个blk_t的数据类型,blk_t是一个返回值为int，并且有一个为int类型的形参；因此可以通过blk_t来定义变量；
   
     blk_t blk = ^ int (int a){
        return a + 2;
     };   
     
### Block的种类  
按照block的在内存中的创建位置可以分为： 
  
+ 栈block ：栈上创建的block执行copy操作，会被在堆上执行一个拷贝，在堆上创建一个完全一致的block
+ 堆block ：堆上的block执行copy操作会增加引用计数
+ 全局block：全局的block执行copy操作，无任何变化

####  栈block   

       // 下列写法 block分配在栈上，超过作用域会被释放载调用stackBlock会引发异常
    BOOL isConditionOk = NO;
    void (^stackBlock)();
    if (isConditionOk) {
        stackBlock = ^{
            NSLog(@"if");
        };
    }else{
        stackBlock = ^{
            NSLog(@"else");
        };
    }
    stackBlock();   
    
####  堆block   

     // 解决上述分配在堆上的block调用崩溃问题，只需要将栈上的block copy到堆上
     if (isConditionOk) {
         stackBlock = [^{
            NSLog(@"if");
         }copy];
     }else{
         stackBlock = [^{
            NSLog(@"else");
         } copy];
     } 

### Block的实现原理   
HZMBlock.m文件  

    #import "HZMBlock.h"

	@implementation HZMBlock
	- (void)testMethod{
	    int(^sumBlock)(int a,int b) = ^(int a,int b){
	        return a + b;
	    };
	    
        sumBlock(1,2);
	}
	@end   
	
使用`clang -rewrite-objc HZMBlock.m`得到block的具体实现  

    // @implementation HZMBlock

	struct __HZMBlock__testMethod_block_impl_0 {
	  struct __block_impl impl;// __block_impl结构体类型的指针
	  struct __HZMBlock__testMethod_block_desc_0* Desc;
	  // 初始化函数  
	   __HZMBlock__testMethod_block_impl_0(void *fp, struct __HZMBlock__testMethod_block_desc_0 *desc, int flags=0) {
	    impl.isa = &_NSConcreteStackBlock;
	    impl.Flags = flags;
	    impl.FuncPtr = fp;// 函数指针对应block的实现
	    Desc = desc;
	  }
	};
	
	
	static int __HZMBlock__testMethod_block_func_0(struct __HZMBlock__testMethod_block_impl_0 *__cself, int a, int b) {
	
	        return a + b;
	    }

	static struct __HZMBlock__testMethod_block_desc_0 {
	  size_t reserved;
	  size_t Block_size;
	} __HZMBlock__testMethod_block_desc_0_DATA = { 0, sizeof(struct __HZMBlock__testMethod_block_impl_0)};
    
    
	
	static void _I_HZMBlock_testMethod(HZMBlock * self, SEL _cmd) {

    int(*sumBlock)(int a,int b) = ((int (*)(int, int))&__HZMBlock__testMethod_block_impl_0((void *)__HZMBlock__testMethod_block_func_0, &__HZMBlock__testMethod_block_desc_0_DATA));
    
    // 调用
    ((int (*)(__block_impl *, int, int))((__block_impl *)sumBlock)->FuncPtr)((__block_impl *)sumBlock, 1, 2);
    }
    // @end
    
    struct __block_impl {
	  void *isa;
	  int Flags;
	  int Reserved;
	  void *FuncPtr;
	};

### Block捕获值   
   
+ 局部基本类型：捕获其值
+ 局部对象类型：捕获值及其所有权
+ 局部静态变量：捕获其指针
+ 全局变量、全局静态变量：不做任何操作


### __block修饰符   
使用`__block int sum = 0;` sum会被变成对象 ，block捕获的将是一个int*类型的指针

    struct __Block_byref_sum_0 {
	  void *__isa;
	 __Block_byref_sum_0 *__forwarding;
	 int __flags;
	 int __size;
	 int sum;
	};

### block的循环引用问题   
 
+ 自身循环引用   
    
	    {
	        /*
	         以下代码会造成循环引用
	         解决方案： __weak NSString *tempName = _name;
	         在block中使用tempName变量
	         */
        
        _testBlock = ^(NSString*message){
            NSString *lastStr = [NSString stringWithFormat:@"%@%@",_name,message];
            NSLog(@"%@",lastStr);
        };
        }
        
        
            // weakSelf :避免self的强循环引用
		    __weak typeof(self) weakSelf = self;
		    self.testBlock = ^(NSString* message){
		//        strongSelf:避免weakSelf为nil的情况?????
		        __strong typeof(weakSelf)strongSelf = weakSelf;
		        NSString* nameNew = strongSelf.name;
		        NSLog(@"%@",nameNew);
		      //  Capturing 'self' strongly in this block is likely to lead to a retain cycle
		    };
        
        
+ __block引发的大环循环引用   

   


