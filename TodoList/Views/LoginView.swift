//
//  LoginView.swift
//  TodoList
//
//  Created by Nguyễn Duy Anh on 08/09/2021.
//

import SwiftUI

struct LoginView: View {
    @State var emailText: String = ""
    @State var passwordText: String = ""
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/) {
                Spacer()
                Image("login").resizable()
                    .frame(maxWidth: 150, maxHeight: 150)
                Spacer()
            }
            Text("Login").font(.largeTitle).fontWeight(.bold).padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).frame(width: .infinity, alignment: .leading)
            VStack{
                HStack {
                    Image(systemName: "mail")
                    TextField("Enter your email", text: $emailText)
                }.padding(.bottom, 5)
                Divider()
                Spacer().frame(maxHeight: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                HStack {
                    Image(systemName: "lock")
                    SecureField("Enter your password", text: $passwordText)
                }.padding(.bottom, 5)
                Divider()
                Spacer().frame(maxHeight: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    Text("Forgot Password?").font(.subheadline).foregroundColor(.blue)
                }
                Spacer().frame(maxHeight: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Button(action: {
                    loginViewModel.state == .signingIn ?  print("loading") : loginViewModel.signInWithEmailAndPass(email: emailText, pass: passwordText) 
                }, label: {
                    if loginViewModel.state == .signingIn {
                        ProgressView().progressViewStyle(CircularProgressViewStyle()).foregroundColor(.white).font(.headline).frame(height:50).frame(maxWidth: .infinity).background(Color.accentColor).cornerRadius(10)
                    }else{
                        Text("Sign In").foregroundColor(.white).font(.headline).frame(height:50).frame(maxWidth: .infinity).background(Color.accentColor).cornerRadius(10)
                    }
                    
                })
                Text("OR").font(.subheadline).foregroundColor(.gray).padding(.top, 5).padding(.bottom, 5)
                
            }.padding(.horizontal, 10)
            VStack {
                Button(action: {
                    loginViewModel.state == .signingInGoogle ?  print("loading") : loginViewModel.signInGoogle() 
                }, label: {
                    Image("search").resizable().frame(maxWidth: 20, maxHeight: 20)
                    Text("Continue with Google").foregroundColor(.gray).font(.headline)
                    
                }).frame(height: 50).frame(maxWidth: .infinity).background(Color.white).cornerRadius(10).overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 0.5)
                )
                Button(action: {
                    loginViewModel.state == .sinningInFaceBook ?  print("loading") : loginViewModel.signInWithFacebook() 
                }, label: {
                    Image("facebook").resizable().frame(maxWidth: 20, maxHeight: 20)
                    Text("Continue with Facebook").foregroundColor(.gray).font(.headline)
                    
                }).frame(height: 50).frame(maxWidth: .infinity).background(Color.white).cornerRadius(10).overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 0.5))
            }.padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

