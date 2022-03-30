//
//  adsApp.swift
//  ads
//
//  Created by Sasitha Dilshan on 2022-03-29.
//

import SwiftUI
import Firebase

@main
struct adsApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var deligate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject,UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
