//
//  LoginViewModel.swift
//  TodoList
//
//  Created by Nguyễn Duy Anh on 10/09/2021.
//

import Foundation
import Firebase
import FirebaseAuth
import GoogleSignIn
class LoginViewModel: NSObject, ObservableObject {
    
    enum SignInState {
        case signingIn
        case signedIn
        case signedOut
    }
    
    @Published var state: SignInState = .signedOut
    
    func signInWithEmailAndPass(email: String, pass: String){
        self.state = .signingIn
        let credentials = EmailAuthProvider.credential(withEmail: email, password: pass)
        Auth.auth().signIn(with: credentials){ (_, error) in
            if let error = error {
                print(error.localizedDescription)
            }else{
                self.state = .signedIn
            }
        }
    }
    
    func signInGoogle(){
        if GIDSignIn.sharedInstance().currentUser == nil {
            GIDSignIn.sharedInstance().presentingViewController = UIApplication.shared.windows.first?.rootViewController
            GIDSignIn.sharedInstance().signIn()
        }
    }
    
}


