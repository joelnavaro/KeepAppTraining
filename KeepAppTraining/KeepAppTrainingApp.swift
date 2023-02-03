//
//  KeepAppTrainingApp.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-01-25.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

@main
struct KeepAppTrainingApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var viewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
                ContentView()
                    .environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
    
}
