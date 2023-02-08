//
//  ContentView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-01-25.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore


struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    //este workout solo sale en contentview(), no en overview
    // CV es la app y lo demas son solo views
    //@StateObject var workout = Workout()
    
    var body: some View {
        VStack {
            NavigationView{
                if viewModel.userCreated{
                    VStack{
                        HomeView()
                        /*Button(action: {
                            viewModel.signOut()
                        }, label: {
                            Text("Sign Out")
                                .foregroundColor(Color.white)
                                .frame(width: 200, height: 50)
                                .background(Color.red)
                                .cornerRadius(8)
                                .padding()
                        })*/
                    }
                }else{
                    SignInView()
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    @EnvironmentObject var viewModel: AppViewModel
    
    static var previews: some View {
        ContentView()
            .environmentObject(AppViewModel())
    }
}
