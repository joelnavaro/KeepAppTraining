//
//  ContentView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-01-25.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject{
    let auth = Auth.auth()
    @Published var signedIn = false
    
    var isSignedIn: Bool{
        //auth.currentuser== nil > not signed in
        //!=nil > signed in
        return auth.currentUser != nil
    }
    
    func singIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password, completion: {
            [weak self] result, error in
            guard result != nil, error == nil else {return}
            //success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        })
    }
    func singUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password, completion: {
            [weak self] result, error in
            guard result != nil, error == nil else {return}
            //success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        })
    }
    func signOut(){
        try? auth.signOut()
        self.signedIn = false
    }
}

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            NavigationView{
                if viewModel.isSignedIn{
                    VStack{
                        Text("You are signed in")
                        Button(action: {
                            viewModel.signOut()
                        }, label: {
                            Text("Sign Out")
                                .foregroundColor(Color.white)
                                .frame(width: 200, height: 50)
                                .background(Color.red)
                                .cornerRadius(8)
                                .padding()
                        })
                    }
                }else{
                    SignInView()
                }
            }
            .onAppear(perform: {
                viewModel.signedIn = viewModel.isSignedIn
            })
        }
    }
}
    
struct SignInView: View {
    
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        ZStack {
            Color(red: 202/256, green: 242/256, blue: 249/256)
                .ignoresSafeArea()
            VStack{
                Image(systemName:"dumbbell.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                VStack{
                    TextField("Email Address", text: $email)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    SecureField("Password", text: $password)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    Button(action: {
                        //make sure email and password are not empty
                        guard !email.isEmpty, !password.isEmpty else {return}
                        
                        viewModel.singIn(email: email, password: password)
                    }, label: {
                        Text("Sign In")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                    })
                    NavigationLink("Create Account", destination: SignUpView())
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
        VStack {
            VStack{
                //Spacer()
                Image(systemName:"dumbbell.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                VStack{
                    TextField("Email Address", text: $email)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    SecureField("Password", text: $password)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    Button(action: {
                        //make sure email and password are not empty
                        guard !email.isEmpty, !password.isEmpty else {return}
                        
                        viewModel.singUp(email: email, password: password)
                    }, label: {
                        Text("Create Account")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(8)
                            .background(Color.blue)
                    })
                    //NavigationLink("Create Account", destination: SignUpView())
                        .padding()
                }
                .padding()
                
                Spacer()
                
            }
            .navigationTitle("Create Account")
            
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
