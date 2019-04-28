//
//  AppDelegate.swift
//  FB_project
//
//  Created by Keyue JIANG on 2019/4/7.
//  Copyright © 2019 Keyue JIANG. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // 程序从active状态进入inactive状态时，调用该函数。用于暂停进程、计时器、GUI等等
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // 程序进入后台运行时调用该函数，用于保存用户数据，保存应用状态等
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // 程序从后台进入active状态时调用。
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // 进入active状态调用，重启之卡进暂停的程序等
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // 程序被终止时调用，用于存储数据，保存进度等。
    }


}
