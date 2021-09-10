//
//  TodoListApp.swift
//  TodoList
//
//  Created by Nguyễn Duy Anh on 04/09/2021.
//

import SwiftUI
import Firebase

@main
struct TodoListApp: App {
    @StateObject var loginViewModel: LoginViewModel = LoginViewModel()
    
    init() {
        setupAuthentication()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
            }.navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(loginViewModel)
        }
    }
}

extension TodoListApp{
    private func setupAuthentication(){
        FirebaseApp.configure()
    }
}
