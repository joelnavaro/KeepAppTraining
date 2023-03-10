//
//  SignInView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-01.
//

import SwiftUI

import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            VStack(){
                Spacer()
                Image(systemName:"dumbbell.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                Text("KeepAppTraining").font(.system(size: 40)).padding(.bottom, 8)
                VStack{
                    Group{
                        TextField("Email Address", text: $email)
                        SecureField("Password", text: $password)
                    }
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    Button(action: {
                        //make sure email and password are not empty, write different code, so the user knows what happens if the button doesnt react
                        guard !email.isEmpty, !password.isEmpty else {
                            
                            return
                        }
                        viewModel.singIn(email: email, password: password)
                    }, label: {
                        Text("Sign In")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                    })
                    NavigationLink("Create Account", destination: SignUpView())
                    /*NavigationLink("Try without account", destination: HomeView()).onTapGesture {
                        if Auth.auth().currentUser == nil {
                         viewModel.signedIn = true
                         viewModel.signInAnonymously()
                         }
                         //does not work: ask david how to make a tapgesture work!
                         //viewModel.signedIn = true
                         print(viewModel.signedIn)
                    }*/
                }
                .padding()
                Spacer()
            }
            .navigationTitle("Sign In")
        }
    }
}
struct SignUpView: View {
    
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        ZStack {
            Color.appBackground2.ignoresSafeArea()
            VStack{
                Spacer()
                Image(systemName:"dumbbell.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                Text("KeepAppTraining").font(.system(size: 40)).padding(.bottom, 8)
                
                VStack{
                    Group{
                        TextField("Email Address", text: $email)
                        SecureField("Password", text: $password)
                    }
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    Button(action: {
                        //make sure email and password are not empty, write different code, so the user knows what happens if the button doesnt react
                        guard !email.isEmpty, !password.isEmpty else {return}
                        
                        viewModel.singUp(email: email, password: password)
                    }, label: {
                        Text("Create Account")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(8)
                            .background(Color.blue)
                    })
                    .padding()
                }
                .padding()
                Spacer()
            }
            .navigationTitle("Create Account")
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    @EnvironmentObject var viewModel: AppViewModel
    
    static var previews: some View {
        SignInView()
            .environmentObject(AppViewModel())
    }
}
