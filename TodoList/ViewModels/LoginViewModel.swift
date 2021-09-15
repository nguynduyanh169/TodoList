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
import FBSDKLoginKit
class LoginViewModel: NSObject, ObservableObject {
    private let premission = ["public_profile", "email"]
    enum SignInState {
        case signingIn
        case signingInGoogle
        case sinningInFaceBook
        case signedIn
        case signedOut
        case signInError
    }
    
    @Published var state: SignInState = .signedOut
    
    override init() {
        super.init()
        setupGoogleSignIn()
    }
    
    func signInWithEmailAndPass(email: String, pass: String){
        self.state = .signingIn
        let credentials = EmailAuthProvider.credential(withEmail: email, password: pass)
        Auth.auth().signIn(with: credentials){ (_, error) in
            if let error = error {
                self.state = .signInError
                print(error.localizedDescription)
                let alertController = UIAlertController(title: "Sign in Failed", message: error.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                alertController.self.present(alertController, animated: true)
                return
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
    
    func signInWithFacebook(){
        let fbLoginManager = LoginManager()
        self.state = .sinningInFaceBook
        fbLoginManager.logIn(permissions: premission, from: UIApplication.shared.windows.first?.rootViewController){ (result, error) in
            if let error = error {
                print(error.localizedDescription)
                let alertController = UIAlertController(title: "Sign in Failed", message: error.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                return
            }
            
            if(result?.isCancelled == true){
                print("User cancel")
                return
            }
            
            
            let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
            
            Auth.auth().signIn(with: credential, completion: {
                (user, error) in
                if let error = error{
                    print(error.localizedDescription)
                    let alertController = UIAlertController(title: "Sign in Failed", message: error.localizedDescription, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okAction)
                    return
                }else{
                    self.state = .signedIn
                }
            })
            
        }
    }
    
    
    
    private func setupGoogleSignIn(){
        GIDSignIn.sharedInstance().delegate = self
    }
    
    private func setupFacebookLogin(){
        
    }
    
}

extension LoginViewModel: GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if(error == nil){
            firebaseAuthenticationWithGoogle(withUser: user)
        }else{
            print(error.debugDescription)
            let alertController = UIAlertController(title: "Sign in Failed", message: error.debugDescription, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(okAction)
            return
        }
    }
    
    private func firebaseAuthenticationWithGoogle(withUser user: GIDGoogleUser){
        self.state = .signingInGoogle
        if let authentication = user.authentication{
            let credentials = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
            Auth.auth().signIn(with: credentials) { (_, error) in
                if let error = error{
                    print(error.localizedDescription)
                    let alertController = UIAlertController(title: "Sign in Failed", message: error.localizedDescription, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okAction)
                }else{
                    self.state = .signedIn
                }
                
            }
        }
    }
}


