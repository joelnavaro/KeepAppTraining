//
//  Workout.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-01-31.
//

import SwiftUI

class Workout: Identifiable, ObservableObject{
    var id = UUID()
    var name : String
    //image for the workoutview
    //var image : Image or UIImage
    //emoji to show on the lists
    //var b = "💪🏾"
    //added these 2 to exercise instead
    //int for sets
    var sets : Int
    //int for repetitions
    var repetitions : Int
    
    //a workout is a list of exercises
    var exercisesList : [Exercise] = [] //an empty list, doesnt need to be declared in init
    //var exercisesList2 = [Exercise]() //why not like this?
    
    
    init(name : String, sets : Int, repetitions : Int) {
        self.name = name
        self.sets = sets
        self.repetitions = repetitions
      //  self.exercisesList = exercisesList
        addMockData()
    }
    
    func addMockData(){
        //MARK: this list is supposed to be empty when creating a workout
        exercisesList.append(Exercise(name: "Cable Triceps Pushdown", muscleGroup: "Arms", sets: 8,repetitions: 8))
        exercisesList.append(Exercise(name: "Biceps curl", muscleGroup: "Arms", sets: 8,repetitions: 8))
        exercisesList.append(Exercise(name: "Cable Chest Flys", muscleGroup: "Chest", sets: 4,repetitions: 10))
        exercisesList.append(Exercise(name: "Incline Bench Press", muscleGroup: "Chest", sets: 4,repetitions: 10))
        exercisesList.append(Exercise(name: "Back extension", muscleGroup: "Back", sets: 4,repetitions: 6))
        exercisesList.append(Exercise(name: "Lat Pull-Down", muscleGroup: "Back", sets: 4,repetitions: 6))
        exercisesList.append(Exercise(name: "Back Squat", muscleGroup: "Legs", sets: 4,repetitions: 8))
        exercisesList.append(Exercise(name: "Front Squat", muscleGroup: "Legs", sets: 4,repetitions: 8))
        
        //var a = Workout(name: "test", sets: 3, repetitions: 10)
        
        
    }
}
