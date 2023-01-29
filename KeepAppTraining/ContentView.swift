//
//  ContentView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-01-25.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            NavigationView{
                if viewModel.isSignedIn{
                    
                    //agregar aqui interface para overview
                    VStack{
                        Overview()
                        //Text("You are signed in")
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
struct Overview: View{
    
    
    var body: some View{
        NavigationView{
            VStack{
                HStack{
                    Image(systemName: "person.fill")
                        .font(.system(size: 64))
                        .padding()
                }
                Spacer()
                HStack{
                    Button(action: {
                        
                    }, label: {
                        Text("Exercises")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                    })
                    Button(action: {
                        
                    }, label: {
                        Text("Create Workout")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                    })
                }.padding()
            }.padding()
        }
        .navigationTitle("Overview")
        .background(Color(.init(white: 0, alpha: 0.05)))
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
            VStack(){
                Spacer()
                Image(systemName:"dumbbell.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
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
                Spacer()
                Image(systemName:"dumbbell.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
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
    @EnvironmentObject var viewModel: AppViewModel
    
    static var previews: some View {
        
        //ContentView()
        //SignInView()
        Overview()
    }
}
