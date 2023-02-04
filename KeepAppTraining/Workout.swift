//
//  Workout.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-01-31.
//

import Foundation
import SwiftUI

class Workout: Identifiable, ObservableObject{
    var id = UUID()
    var name : String?
    @Published var exercisesList = [Exercise]()
    @Published var workoutsList = [Workout]()
    
    init(){
        addMockData()
    }
    
    init(name : String) {
        self.name = name
    }
    
    func addMockData(){
        exercisesList.append(Exercise(name: "Cable Triceps Pushdown", muscleGroup: "Arms"))
        exercisesList.append(Exercise(name: "Biceps curl", muscleGroup: "Arms"))
        exercisesList.append(Exercise(name: "Cable Chest Flys", muscleGroup: "Chest"))
        exercisesList.append(Exercise(name: "Incline Bench Press", muscleGroup: "Chest"))
        exercisesList.append(Exercise(name: "Back extension", muscleGroup: "Back"))
        exercisesList.append(Exercise(name: "Lat Pull-Down", muscleGroup: "Back"))
        exercisesList.append(Exercise(name: "Back Squat", muscleGroup: "Legs"))
        exercisesList.append(Exercise(name: "Front Squat", muscleGroup: "Legs"))
        
        workoutsList.append(Workout(name: "First Workout"))
        workoutsList.append(Workout(name: "Second Workout"))
    }
}
