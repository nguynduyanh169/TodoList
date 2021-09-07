//
//  TodoListApp.swift
//  TodoList
//
//  Created by Nguyễn Duy Anh on 04/09/2021.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }.environmentObject(listViewModel)
        }
    }
}
