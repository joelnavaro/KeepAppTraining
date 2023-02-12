//
//  WorkoutCellView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-11.
//

import SwiftUI

struct WorkoutCellView: View {
    var exercise : Exercise
    
    var body: some View {
        ZStack{
            Color.blankSpace
            VStack{
                HStack{
                    Text("\(exercise.name)")
                    Text("\(exercise.muscleGroup)")
                }
                HStack{
                    Text("\(exercise.sets)")
                    Text("\(exercise.repetitions)")
                }
                VStack{
                    Text("Animation")
                }
            }
        }.frame(width: 350, height: 250)
    }
}

struct WorkoutCellView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCellView(exercise: Exercise(name: "Test", muscleGroup: "Test", sets: 3, repetitions: 10))
    }
}
