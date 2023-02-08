//
//  Exercise.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-01-30.
//

import SwiftUI

struct Exercise: Identifiable, Equatable{
    var id = UUID()
    var name : String
    var muscleGroup : String
    
    //int for sets
    var sets : Int
    //int for repetitions
    var repetitions : Int
    // int for wheight, ouede ser nil, asi vas por libre
    // weight : Double
    
    
    
}
