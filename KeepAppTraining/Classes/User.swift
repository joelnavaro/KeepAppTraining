//
//  User.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-04.
//

import SwiftUI

class User: ObservableObject{
    
    var name: String?
    //remember to change the list from standard to user in exercise view
    //MARK: to save new exercises and show in exercises view
    @Published var exerciseList = [Exercise]()
    //MARK: to save new workouts, and show the exercises lists that exists inside
    @Published var workoutList = [Workout]() //cause ill need to read this list for running workouts in workoutview
    
    //un usuario guarda sus propios ejercicios, pero en la app o en db?
    //en ejercicios mostrarias la lista de ejercicios del usuario
    //@Published var exerciseList = [Exercise]()
    init(){
        exerciseList.append(Exercise(name: "Cable Triceps Pushdown", muscleGroup: "arms", sets: 8,repetitions: 8))
        exerciseList.append(Exercise(name: "Biceps curl", muscleGroup: "arms", sets: 8,repetitions: 8))
        exerciseList.append(Exercise(name: "Cable Chest Flys", muscleGroup: "chest", sets: 4,repetitions: 10))
        exerciseList.append(Exercise(name: "Incline Bench Press", muscleGroup: "chest", sets: 4,repetitions: 10))
        exerciseList.append(Exercise(name: "Back extension", muscleGroup: "back", sets: 4,repetitions: 6))
        exerciseList.append(Exercise(name: "Lat Pull-Down", muscleGroup: "back", sets: 4,repetitions: 6))
        exerciseList.append(Exercise(name: "Back Squat", muscleGroup: "legs", sets: 4,repetitions: 8))
        exerciseList.append(Exercise(name: "Front Squat", muscleGroup: "legs", sets: 4,repetitions: 8))
    }
    
    
    
}
