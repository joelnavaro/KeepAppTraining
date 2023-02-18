//
//  Workout.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-01-31.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Workout: Identifiable, Equatable, Codable{
    @DocumentID var id : String?
    var name : String?
    //image for the workoutview
    //var image : Image or UIImage
    //emoji to show on the lists
    //var b = "💪🏾"
    
    var date : Date = Date()
    
    //a workout is a list of exercises
    var exercisesList = [Exercise]()//an empty list, doesnt need to be declared in init
    //var exercisesList2 = [Exercise]() //why not like this?
    
    
    
    func dummyData(){
        
    }
}
