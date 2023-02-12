//
//  AddWorkoutView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-07.
//

import SwiftUI

struct AddWorkoutView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @State var name = ""
    @State var isChecked = false
    
    
    /*en la funcion que haga un workour object anade esta funcion
    var date : String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: workout.date)
    }*/
    
    
    var body: some View {
        ZStack{
            Color.inApp2.ignoresSafeArea()
            VStack{
                ZStack{
                    Color.blankSpace
                        .frame(width: 200, height: 50)
                        .clipShape(Rectangle())
                        .overlay(Rectangle().stroke(Color.blue, lineWidth: 2))
                        .cornerRadius(10)
                        .shadow(color: Color.black, radius: 3, x: 2)
                        .padding(.top, 50)
                        .padding(.bottom, 50)
                    Text("Add Workout (Title)")
                }
                //MARK: Name and group
                HStack{
                    ZStack{
                        Color.blankSpace
                            .frame(width: 60, height: 30)
                            .clipShape(Rectangle())
                            .overlay(Rectangle().stroke(Color.blue, lineWidth: 2))
                            .cornerRadius(10)
                            .shadow(color: Color.black, radius: 3, x: 2)
                        Text("Name: ")
                    }
                    TextField("Name...", text: $name).background(Color.white)
                }
                .padding(10)
                VStack{
                    List(){
                        ForEach(viewModel.standardExerciseList) { exercise in
                            HStack{
                                Text(exercise.name)
                                Spacer()
                                //Image(systemName: "square")
                                /*Toggle(isOn: $isChecked, label: {
                                    Text(exercise.name)
                                })*/
                                /*
                                Image(systemName: exercise.done ? "checkmark.square" : "square")*/
                                /*Button(action: {
                                    exercise.isSelected.toggle()
                                }, label: {
                                    Image(systemName: exercise.isSelected ? "checkmark.square" : "square")
                                })*/
                            }
                        }
                        .listRowBackground(Color.blankSpace)
                    }
                    Button(action: {
                        
                    }, label: {
                        Text("Done")
                    })
                }
                .cornerRadius(10)
                .padding(10)
            }
        }
    }
    func addWorkout(){
        // crea y append ejercicios a una lista, que luego agregaras al newworkout
        //let newWorkout = Workout(name: name, exercisesList:  )
    }
}

/*struct AddWorkoutView_Previews: PreviewProvider {
    @EnvironmentObject var viewModel: AppViewModel
    
    static var previews: some View {
        AddWorkoutView()
            .environmentObject(AppViewModel())
    }
}*/
