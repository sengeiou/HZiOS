//
//  AppDelegate.swift
//  HZSwiftUIKIT
//
//  Created by apple on 16/10/31.
//  Copyright © 2016年 HZ. All rights reserved.
//

import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //实现 3D Touch的Quick Actions快捷动作 iOS9以上才具有此功能
        
        let addEventIcon = UIApplicationShortcutIcon(type: .add)
        let unlockEventIcon = UIApplicationShortcutIcon(templateImageName: "")
        let listEventIcon = UIApplicationShortcutIcon(templateImageName: "")
        
        let addEvent = UIApplicationShortcutItem(type: "com.HZ.addMember", localizedTitle: "添加会员", localizedSubtitle:"Add Member", icon: addEventIcon, userInfo: nil)
        let unlockEvent = UIApplicationShortcutItem(type: "com.HZ.unlockMember", localizedTitle: "解锁会员", localizedSubtitle:"Unlock Member", icon: unlockEventIcon, userInfo: nil)
        let listEvent = UIApplicationShortcutItem(type: "com.HZ.listMember", localizedTitle: "会员列表", localizedSubtitle:"List Member", icon: listEventIcon, userInfo: nil)
        
        let shortCutItem = [addEvent,unlockEvent,listEvent]
        application.shortcutItems = shortCutItem
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white;
        self.window?.rootViewController = UINavigationController(rootViewController: ViewController())
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        if shortcutItem.type == "com.HZ.addMember"{
            print("addMenber")
        }else if shortcutItem.type == "com.HZ.unlockMember"{
            print("unlockMember")
        }else if shortcutItem.type == "com.HZ.listMember"{
            print("listMember")
        }
    }

}

