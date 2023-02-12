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
    
//MARK: USER EXISTS AND TELLS THE STATE SIGNEDIN
    var userCreated : Bool{
        return auth.currentUser != nil
        //auth.currentuser == nil > not signed in
        //!=nil > signed in
    }
    
    init(){
        mockdata()
    }
    func mockdata(){
        //for the user workoutlist
        user.workoutList.append(Workout(name: " User First Workout"))
        
        //for the base woroutlist in viewmodel
        standardWorkoutsList.append(Workout(name: "AppModel First Workout"))
        
        standardExerciseList.append(Exercise(name: "Cable Triceps Pushdown", muscleGroup: "arms", sets: 8,repetitions: 8, isSelected: false))
        standardExerciseList.append(Exercise(name: "Biceps curl", muscleGroup: "arms", sets: 8,repetitions: 8, isSelected: false))
        standardExerciseList.append(Exercise(name: "Cable Chest Flys", muscleGroup: "chest", sets: 4,repetitions: 10, isSelected: true))
        standardExerciseList.append(Exercise(name: "Incline Bench Press", muscleGroup: "chest", sets: 4,repetitions: 10, isSelected: false))
        standardExerciseList.append(Exercise(name: "Back extension", muscleGroup: "back", sets: 4,repetitions: 6, isSelected: true))
        standardExerciseList.append(Exercise(name: "Lat Pull-Down", muscleGroup: "back", sets: 4,repetitions: 6, isSelected: false))
        standardExerciseList.append(Exercise(name: "Back Squat", muscleGroup: "legs", sets: 4,repetitions: 8, isSelected: false))
        standardExerciseList.append(Exercise(name: "Front Squat", muscleGroup: "legs", sets: 4,repetitions: 8, isSelected: false))
        
        /*standardExerciseList.append(Exercise(name: "Cable Triceps Pushdown", muscleGroup: "arms", sets: 8,repetitions: 8))
        standardExerciseList.append(Exercise(name: "Biceps curl", muscleGroup: "arms", sets: 8,repetitions: 8))
        standardExerciseList.append(Exercise(name: "Cable Chest Flys", muscleGroup: "chest", sets: 4,repetitions: 10))
        standardExerciseList.append(Exercise(name: "Incline Bench Press", muscleGroup: "chest", sets: 4,repetitions: 10))
        standardExerciseList.append(Exercise(name: "Back extension", muscleGroup: "back", sets: 4,repetitions: 6))
        standardExerciseList.append(Exercise(name: "Lat Pull-Down", muscleGroup: "back", sets: 4,repetitions: 6))
        standardExerciseList.append(Exercise(name: "Back Squat", muscleGroup: "legs", sets: 4,repetitions: 8))
        standardExerciseList.append(Exercise(name: "Front Squat", muscleGroup: "legs", sets: 4,repetitions: 8))*/
        
    }
    
    //crear funciones read/write from database
    
//MARK: Login funcstions
    func signInAnonymously(){
        if auth.currentUser == nil{
            auth.signInAnonymously { authResult, error in
                if let error = error{
                    print("Failed to sign in: ", error)
                    return
                }else{
                    print("Succesfully signed in: \(authResult?.user.uid ?? "")")
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
//MARK: delete functions
    func deleteStandardExercise(indexSet: IndexSet){
        standardExerciseList.remove(atOffsets: indexSet)
    }
    func deleteUserExercise(indexSet: IndexSet){
        user.exerciseList.remove(atOffsets: indexSet)
    }
    func deleteUserWorkout(at indexSet: IndexSet){
        user.workoutList.remove(atOffsets: indexSet)
    }
    func deleteStandardWorkout(at indexSet: IndexSet){
        standardWorkoutsList.remove(atOffsets: indexSet)
    }
//MARK: save functions
    
    
}
