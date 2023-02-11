//
//  WorkoutView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-07.
//

import SwiftUI

struct ShowWorkoutView: View {
    @EnvironmentObject var viewModel : AppViewModel
    @State var restTime = ""
    var entryName: String
    var entryExerList: [Exercise]
    
    var body: some View {
        
        //a field to set rest time betwen exercises
        //how a row for the exercises is shown (showing name of the exercise, the rest time chosen, a delete option, a countdown for the restime)
        VStack{
            //MARK: rest time bar
            HStack{
                Spacer(minLength: 25)
                Text("Rest time: ")
                Button(action: {
                    
                }, label: {
                    TextField("Rest inbetwen sets", text: $restTime)
                })
            }
            //MARK: List with rows for every workout
            List() {
                ForEach(entryExerList) { exercise in
                    /*Text(exercise.name)*/
                    VStack (alignment: .center){
                        WorkoutCellView(exercise: exercise)
                            .cornerRadius(25)
                        /*Text("Define SetRow")
                        RoundedRectangle(cornerRadius: 50).fill(.gray)
                            .frame(width: 350, height: 60)*/
                    }
                }
                .padding(-5)
            }
            .padding(-15)
        }
        .navigationTitle("\(entryName)") //the name of the workoutentry from user list
    }
}

/*struct WorkoutView_Previews: PreviewProvider {
    @EnvironmentObject var viewModel: AppViewModel
    var entry = Workout(name: "Preview", sets: 3, repetitions: 10)
    
    static var previews: some View {
        WorkoutView(workoutEntry: entry )
            .environmentObject(AppViewModel())
    }
}*/
