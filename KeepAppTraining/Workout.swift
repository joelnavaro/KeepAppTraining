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
        
        workoutsList.append(Workout(name: "First Workout"))
        workoutsList.append(Workout(name: "Second Workout"))
    }
}
