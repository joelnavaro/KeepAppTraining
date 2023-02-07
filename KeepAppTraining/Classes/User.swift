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
    var exerciseList = [Exercise]()
    //MARK: to save new workouts, and show the exercises lists that exists inside
    @Published var workoutList = [Workout]() //cause ill need to read this list for running workouts in workoutview
    
    //un usuario guarda sus propios ejercicios, pero en la app o en db?
    //en ejercicios mostrarias la lista de ejercicios del usuario
    //@Published var exerciseList = [Exercise]()
    
    
    
}
