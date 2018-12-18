## 制作cocoapod库 

### 创建私有Pod lib
 xxx/ 目录下执行
 pod lib create HTJView  【创建pod的模板】
 
### 进入Example目录，执行CocoaPods安装命令 

 pod install --no-repo-update
 
### 运行 HTJView.xcworkspace

### 添加源代码文件到 xxx/HTJView/Classes/目录下

### 修改 HTJView.podspec 

### 安装本地源文件 【Example目录下】
pod update --no-repo-update

### 执行本地pod命令验证 【在HTJView.podspec所在的目录下】
pod lib lint

### 创建代码仓库
以github为例： https://github.com/huaTJ0210/HTJView.git

### 将本地文件推送到远程仓库  
git remote add origin https://github.com/huaTJ0210/HTJView.git 
git add .
git commit -a -m "0.1.0"
git pull origin master  报错解决：[fatal: refusing to merge unrelated histories  ] -> git merge origin/master --allow-unrelated-histories 
git push origin master
git tag 0.1.0
git push origin 0.1.0

### 发布到cocoapod上   

#### 注册trunk 【已注册可忽略】
 pod trunk register huatj0210@163.com  'huaTJ' --description='描述信息'  
 
#### 通过验证后执行 【已注册可忽略】
 pod trunk me
####  发布 
 pod trunk push HTJView.podspec

