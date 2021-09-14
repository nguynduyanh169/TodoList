//
//  TodoListApp.swift
//  TodoList
//
//  Created by Nguyễn Duy Anh on 04/09/2021.
//

import SwiftUI
import Firebase
import GoogleSignIn
import FBSDKLoginKit
import FBSDKCoreKit

@main
struct TodoListApp: App {
    @StateObject var loginViewModel: LoginViewModel = LoginViewModel()
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        setupAuthentication()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
            }.navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(loginViewModel).environmentObject(listViewModel)
        }
    }

}

extension TodoListApp{
    private func setupAuthentication(){
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        Profile.enableUpdatesOnAccessTokenChange(true)
    }
    
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Override point for customization after application launch.
            
            ApplicationDelegate.shared.application(
                application,
                didFinishLaunchingWithOptions:
                launchOptions
            )
            
            return true
        }
        
        func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            return ApplicationDelegate.shared.application(
                app,
                open: url,
                options: options
            )
        }
}
