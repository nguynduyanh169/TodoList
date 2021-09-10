//
//  MainView.swift
//  TodoList
//
//  Created by Nguyễn Duy Anh on 10/09/2021.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some View {
        switch loginViewModel.state {
        case .signedIn: ListView().environmentObject(listViewModel)
        case .signedOut: LoginView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
