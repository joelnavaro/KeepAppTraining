//
//  User.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-04.
//

import SwiftUI

class User: ObservableObject{
    
    var firstName: String?
    var lastName: String?
    var age: Int?
    //remember to change the list from standard to user in exercise view
    //MARK: to save new exercises only added by user. but ill use the viewmodel list
    //@Published var exerciseList = [Exercise]()
    //MARK: to save new workouts, and show the exercises lists that exists inside
    @Published var workoutList = [Workout]() //cause ill need to read this list for running workouts in workoutview
    
}
