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
import FirebaseFirestoreSwift

class AppViewModel: ObservableObject{
    let auth = Auth.auth()
    let db = Firestore.firestore()
    
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
        //creates a first workout for the user and fills its list with exercises
        var firstWorkout = Workout(name: "User's First Workout")
        firstWorkout.exercisesList.append(Exercise(name: "Cable Triceps Pushdown", muscleGroup: "arms", sets: 8,repetitions: 8))
        firstWorkout.exercisesList.append(Exercise(name: "Biceps curl", muscleGroup: "arms", sets: 8,repetitions: 8))
        firstWorkout.exercisesList.append(Exercise(name: "Cable Chest Flys", muscleGroup: "chest", sets: 4,repetitions: 10))
        firstWorkout.exercisesList.append(Exercise(name: "Incline Bench Press", muscleGroup: "chest", sets: 4,repetitions: 10))
        firstWorkout.exercisesList.append(Exercise(name: "Back extension", muscleGroup: "back", sets: 4,repetitions: 6))
        firstWorkout.exercisesList.append(Exercise(name: "Lat Pull-Down", muscleGroup: "back", sets: 4,repetitions: 6))
        firstWorkout.exercisesList.append(Exercise(name: "Back Squat", muscleGroup: "legs", sets: 4,repetitions: 8))
        firstWorkout.exercisesList.append(Exercise(name: "Front Squat", muscleGroup: "legs", sets: 4,repetitions: 8))
        
        
        user.workoutList.append(firstWorkout)

        listenToFirestore()
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
    /*func deleteUserExercise(indexSet: IndexSet){
        user.exerciseList.remove(atOffsets: indexSet)
    }*/
    func deleteUserWorkout(at indexSet: IndexSet){
        user.workoutList.remove(atOffsets: indexSet)
    }
    func deleteStandardWorkout(at indexSet: IndexSet){
        standardWorkoutsList.remove(atOffsets: indexSet)
    }
//MARK: save functions
    func listenToFirestore(){
        guard let user = Auth.auth().currentUser else {return}
        
        db.collection("users").document(user.uid).collection("exercises").addSnapshotListener{snapshot, err in
            //constatar que no es nil
            guard let snapshot = snapshot else {return}
            //constatar si hay error
            if let err = err{
                print("Error getting document \(err)")
            }else{
                //the list where you save
                self.standardExerciseList.removeAll()
                //empezamos a leer documentos
                for document in snapshot.documents{
                    let result = Result{
                        try document.data(as: Exercise.self)
                    }
                    switch result{
                    case .success(let item) :
                        self.standardExerciseList.append(item)
                    case .failure(let error) :
                        print("error decoding item: \(error)")
                    }
                }
                
            }
        }
    }
    func saveToFirestore(exercise: Exercise){
        guard let user = auth.currentUser else {return}
        do{
            _ = try db.collection("users").document(user.uid).collection("exercises").addDocument(from: exercise)
        } catch {
            print("error saving to DB")
        }
    }
    func deleteFromDb(indexSet: IndexSet, list: [Exercise]){
        for index in indexSet{
            let item = list[index]
            if let id = item.id,
                let user = auth.currentUser{
                db.collection("users").document(user.uid).collection("exercises").document(id).delete()
            }
        }
    }
    
}
