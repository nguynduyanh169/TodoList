//
//  TodoListApp.swift
//  TodoList
//
//  Created by Nguyễn Duy Anh on 04/09/2021.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct TodoListApp: App {
    @StateObject var loginViewModel: LoginViewModel = LoginViewModel()
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
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
    }
}
