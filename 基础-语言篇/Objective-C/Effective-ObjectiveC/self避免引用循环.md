### 如何声明弱引用self

		#define WeakSelf(type) __weak __typeof__(type) weakSelf = type;
		#define StrongSelf(type) __strong __typeof__(type) strongSelf = type; 
		
### 关于WeakSelf的含义		

     __weak __typeof__(self) weakSelf = self的含义:  
		typeof(self)是获取到self的类型,这样定义的weakSelf就是和self一个类型的,加上__weak是建立一个弱引; 实际定义了一个弱引用性质的替身.
		
### self在block中使用出现的问题

      WeakSelf(self);
	    self.ingoreUnInterestingItemBlock = ^{
	        StrongSelf(weakSelf);
	        [strongSelf doSomthing]
	        // 如果再使用weakSelf执行doAnotherthing有可能被释放，所以应该在内部强引用 ？？
	        [strongSelf doAnotherthing]
	    };
    




