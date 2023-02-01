//
//  Workout.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-01-31.
//

import Foundation

class Workout: Identifiable, ObservableObject{
    var id = UUID()
    var name : String
    @Published var exercises = [Exercise]()
    
    init(name : String, exercises: [Exercise] = [Exercise]()) {
        self.name = name
        self.exercises = exercises
        
        addMockData()
    }
    func addMockData(){
        exercises.append(Exercise(name: "Bicep Curl", muscleGroup: "Bicep"))
    }
}
