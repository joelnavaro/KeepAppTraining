//
//  AppViewModel.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-01-26.
//

import Foundation
import FirebaseAuth

class AppViewModel: ObservableObject{
    let auth = Auth.auth()
    @Published var signedIn = false
    
    var isSignedIn: Bool{
        //auth.currentuser== nil > not signed in
        //!=nil > signed in
        return auth.currentUser != nil
    }
    
    //crear funciones read/write
    
    func singIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password, completion: {
            [weak self] result, error in
            //guard result != nil, error == nil else {return}
            if let error = error{
                print("Failed to sign in: ", error)
             return
            }
            print("Succesfully signed in: \(result?.user.uid ?? "")")
            //success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        })
    }
    func singUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password, completion: {
            [weak self] result, error in
            //guard result != nil, error == nil else {return}
            if let error = error{
                print("Failed to sign un: ", error)
             return
            }
            print("Succesfully created user: \(result?.user.uid ?? "")")
            //success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        })
    }
    func signOut(){
        try? auth.signOut()  //should i catch error for this??
        self.signedIn = false
    }
}
