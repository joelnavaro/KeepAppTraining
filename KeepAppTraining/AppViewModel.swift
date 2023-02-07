//
//  AppViewModel.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-01-26.
//

import Foundation
import FirebaseAuth

import SwiftUI
import FirebaseCore
import FirebaseFirestore

class AppViewModel: ObservableObject{
    let auth = Auth.auth()
    @Published var signedIn = false
    
    @Published var user = User()
    //MARK: standard lists for showing content and anon users
    @Published var standardExerciseList = [Exercise]()
    @Published var standardWorkoutsList = [Workout]()
    
    //auth.currentuser == nil > not signed in
    //!=nil > signed in
    //MARK: USER EXISTS AND TELLS THE STATE SIGNEDIN
    var userCreated : Bool{
        return auth.currentUser != nil
    }
    
    init(){
        mockdata()
    }
    func mockdata(){
        //for the user workoutlist
        user.workoutList.append(Workout(name: " User First Workout", sets: 3, repetitions: 10))
        
        //for the base woroutlist in viewmodel
        standardWorkoutsList.append(Workout(name: "AppModel First Workout", sets: 3, repetitions: 10))
        
        standardExerciseList.append(Exercise(name: "Cable Triceps Pushdown", muscleGroup: "Arms", sets: 8,repetitions: 8))
        standardExerciseList.append(Exercise(name: "Biceps curl", muscleGroup: "Arms", sets: 8,repetitions: 8))
        standardExerciseList.append(Exercise(name: "Cable Chest Flys", muscleGroup: "Chest", sets: 4,repetitions: 10))
        standardExerciseList.append(Exercise(name: "Incline Bench Press", muscleGroup: "Chest", sets: 4,repetitions: 10))
        standardExerciseList.append(Exercise(name: "Back extension", muscleGroup: "Back", sets: 4,repetitions: 6))
        standardExerciseList.append(Exercise(name: "Lat Pull-Down", muscleGroup: "Back", sets: 4,repetitions: 6))
        standardExerciseList.append(Exercise(name: "Back Squat", muscleGroup: "Legs", sets: 4,repetitions: 8))
        standardExerciseList.append(Exercise(name: "Front Squat", muscleGroup: "Legs", sets: 4,repetitions: 8))
        
    }
    //crear funciones read/write
    func signInAnonymously(){
        if auth.currentUser == nil{
            auth.signInAnonymously { authResult, error in
                if let error = error{
                    print("Failed to sign in: ", error)
                    return
                }else{
                    print("Succesfully signed in: \(authResult?.user.uid ?? "")")
                    //self.signedIn = true
                    DispatchQueue.main.async {
                        self.signedIn = true
                    }
                }
                
                /*let currentUser = self.auth.currentUser?.uid
                 if let currentUser = currentUser{
                 print(currentUser)
                 }*/
            }
        }
    }
    
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
