//
//  LoginViewModel.swift
//  TodoList
//
//  Created by Nguyễn Duy Anh on 10/09/2021.
//

import Foundation
import Firebase
import FirebaseAuth
class LoginViewModel: NSObject, ObservableObject {
    
    enum SignInState {
        case signedIn
        case signedOut
    }
    
    @Published var state: SignInState = .signedOut
    
    func signInWithEmailAndPass(email: String, pass: String){
        print(email)
        let credentials = EmailAuthProvider.credential(withEmail: email, password: pass)
        Auth.auth().signIn(with: credentials){ (_, error) in
            if let error = error {
                print(error.localizedDescription)
            }else{
                self.state = .signedIn
            }
        }
    }
    
    
}

