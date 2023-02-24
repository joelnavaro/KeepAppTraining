//
//  WorkoutView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-07.
//

import SwiftUI

struct ShowWorkoutView: View {
    @Environment(\.dismiss) private var dismiss
    @State var restTime = 0
    var entryName: String
    var list: [Exercise]
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var counter = 0
    @Binding var done : Int
    /*var date : String{
     let dateFormatter = DateFormatter()
     dateFormatter.dateStyle = .medium
     return dateFormatter.string(from: <#T##Date#>)
     }*/
    
    var body: some View {
        VStack{
            //MARK: rest time bar
            HStack{
                Spacer(minLength: 25)
                Text("Rest time in seconds: ")
                
                TextField("Rest inbetwen sets", value: $restTime, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            VStack{
                Text("Exercises Completed: \(counter)")
            }
            
            //MARK: List with rows for every exercise
            List(){
                ForEach(list, id: \.name) { exercise in
                    WorkoutCellView(exercise: exercise, restTime: $restTime, completed: $counter).cornerRadius(25)
                }
                .onAppear(){
                    for item in list{
                        print("\(item.name)")
                    }
                }
            }
            .padding(-15)
            Button(action: {
                if counter == list.count{
                    done += 1
                    dismiss()
                }else{
                    dismiss()
                }
            }, label: {
                ButtonView(item: "Finish", w: 100, h: 40)
            })
        }
        .navigationTitle("\(entryName)")
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
