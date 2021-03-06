//
//  AppDelegate.swift
//  Candito 6 Week Strength
//
//  Created by Ern on 2016-02-21.
//  Copyright © 2016 ThoughtPond. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // Trailing question marks means value is optional, could be nil
    var window: UIWindow?
    var navController: UINavigationController?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let setupViewController = SetupViewController()
        //let week1ViewController = WeekViewController()
        //let todaysWorkoutViewController = TodaysWorkoutViewController()
        
        navController = UINavigationController()
        navController?.setNavigationBarHidden(true, animated: false)
        navController?.navigationItem.setHidesBackButton(true, animated: false)
        navController?.navigationItem.hidesBackButton = true

        navController?.viewControllers = [setupViewController]
        
        //let viewController = UIViewController()
        //self.navController!.pushViewController(viewController, animated: false)
        
        //self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // TODO LEARN
        // Forced unwrapping because window may be nil as it hasn't rendered?
        //self.window!.rootViewController = navController
        //self.window!.backgroundColor = UIColor.whiteColor()
        //self.window!.makeKeyAndVisible()
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        // TODO Logic to pick which view is root at statup. If NSUSER data exists, go to WeekViewController.
        
        window?.rootViewController = navController
        // TODO Is this where I pick what I present?
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

