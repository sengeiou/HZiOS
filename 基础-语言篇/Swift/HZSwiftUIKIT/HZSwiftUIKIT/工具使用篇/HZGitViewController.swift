//
//  HZGitViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/26.
//  Copyright © 2018年 HZ. All rights reserved.
/*
   http://www.ruanyifeng.com/blog/2014/06/git_remote.html
 */

import UIKit

class HZGitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
}


/*
   （1） git clone
     + git clone <版本库的网址>  [https/ssh]
    (2)git remote :  用于管理主机名
     + git remote ： 列出所有主机
     + git remote -v : 所有主机的远程地址
    (3) git fetch : 将某个主机的更新全部取回本地
     + git fetch <远程主机名>
     + git fetch <远程主机名> <分支名>
     + git branch -a ：可以查看所有远程仓库的分支
     (4) git pull: 取回远程主机某个分支的更新
     + git pull <远程主机名> <远程分支名>:<本地分支名>
     （5）git push :将本地分支的更新推送到远程主机
      + git push <远程主机名> <本地分支名>:<远程分支名>
 
 
   <一> 工作需求一
    新需求开发，需要从主干创建分支进行开发
    + git clone xxx : 从主干或者Dev分支中获取最新代码仓库
    + git checkout -b huaDev master :本地创建分支
    + git push origin huaDev ：将分支推送到远程仓库，【同team的也可能使用此分支】
 
    此时同一team的人员也要使用此分支开发则：
    + git checkout -b huaDev origin/huaDev：在本地创建一个同远程huaDev一样的本地分支
    + 开发完毕可以直接使用：git push ,将本地分支推送到远程仓库
 
   <二> Github的 pull Request 操作
     + 在创建的分支上进行开发，完成feature后commit change，【自测==》单元测试】
     + 创建New pull Request 给master（或者Dev branch）【code review】
     + 经过code review后的代码合并到master上
     附加：
       实际开发中开发分支的代码要自测，review code ，测试工程师测试，
        然后合并到release分支进行发布，在由master进行merge操作
 
   <三> 实际开发中如何在提交pull Request 给制定的leader完成code review
 
   <四> git的工作流是什么
 
     master
     hotfix branch
     release branch
     Dev branch
     feature branch 1
     feature branch 2
 
     测试流程如何? 虽然feature branch1和feature branch2 有优先级关系，但测试进度没有先后顺序？
 */
