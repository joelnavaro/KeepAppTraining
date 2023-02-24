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
    
    var body: some View {
        VStack {
            NavigationView{
                if viewModel.signedIn{
                    VStack{
                        HomeView()
                    }
                }else{
                    SignInView()
                }
            }.onAppear{
                viewModel.signedIn = viewModel.userCreated
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
