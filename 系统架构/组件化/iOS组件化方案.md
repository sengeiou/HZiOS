## target-action模式  
   
+ [casa-iOS应用架构谈 组件化方案](https://casatwy.com/iOS-Modulization.html)   
+ [CTMediator-demo](https://github.com/casatwy/CTMediator)  

### Mediator 中介者   
 
Mediator主要提供根据`targetName`和`actionName`利用runtime的机制执行`[target performSelector:action withObject:params]`   

### Mediator+Module_xx 分类  

+ Mediator+Module_xx 中以字符串的形式定义了`targetName`和`actionName`
+ Mediator+Module_xx向业务方提供组件中可以使用具体组件的API，例如打开组件：` UIViewController *viewController = [[CTMediator sharedInstance] CTMediator_viewControllerForDetail];` 根据获取到的viewController选择使用present还是push的方式打开 ，API中具体的实现是通过Mediator去寻找指定的Target，完成具体的业务逻辑
+ Mediator+Module_xx需要在主工程维护，供业务方查询和使用  

### Target_xx   

+ Target_xx类在组件内部维护；
+ Target_xx类主要负责实现业务方在Mediator+Module_xx分类中定义的API  

## 中介者模式实现页面之间的解耦模式    

[iOS 组件化方案探索](http://blog.cnbang.net/tech/3080/)  

在实际项目中`A_VC`push到`B_VC`、`A_VC`push到`C_VC`、`C_VC`push到`B_VC`等通常的实现方式是import要push的VC然后实例化，通过导航控制器打开；  

### 如何解决控制器之前的耦合情况  
  
 解决控制器之前的项目引用依赖可以通过中介者模式，使得业务页面的打开依靠 **Mediator** 来实现  
 
 ### 当项目逐渐复杂如何解决**Mediator**变的臃肿问题；    
 
 + 模块化可以建立独立的**Mediator**，例如**Mediator_A**，只负责独立模块；比如通用的业务模块会在app_A和app_B中都使用，这样就能直接将**Mediator_A**和**module_A**直接拿去复用  
 + 对于特定的业务例如活动业务等可以依附工程中统一的**Mediator**   

### 如何解决**Mediator** 中import各个控制器导致的耦合  

这个问题可以通过runtime利用string转class的形式去实例化具体的控制器
 

