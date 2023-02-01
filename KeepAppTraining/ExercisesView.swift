//
//  ExercisesView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-01.
//

import SwiftUI

import SwiftUI

import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct ExercisesView: View{
    //var exercise : Exercise
    @State var chest = [Exercise]()
    @State var menuBool = [false,false,false,false]
    //@StateObject var workout : Workout
    
    var body: some View{
        //Text(exercise.name)
        NavigationView{
            VStack{
                HStack{
                    ExerciseButton(name: "Chest", arrayModel: chest).onTapGesture {
                        /*ForEach(menuBool){ button in
                         button.toggle()
                         }*/
                        menuBool[0].toggle()
                    }
                    ExerciseButton(name: "Arms", arrayModel: chest).onTapGesture {
                        menuBool[1].toggle()
                    }
                }
                HStack{
                    ExerciseButton(name: "Back", arrayModel: chest)
                    ExerciseButton(name: "Legs", arrayModel: chest)
                }
                Text("Here goes a list with content from the Buttons above")
                List{
                    ForEach(chest) { exercise in
                        Text(exercise.name)
                    }
                    
                }
                //needs a sheet to add exercises to a muscle group
                Button(action: {
                    
                }, label: {
                    Text("Add Exercise")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(8)
                })
            }
            .navigationBarTitle("Exercises")
            .background(Color(.init(white: 1, alpha: 0.05)))
            //.sheet(isPresented: <#T##Binding<Bool>#>, content: <#T##() -> View#>)
        }
    }
}
struct ExerciseButton: View {
    //nombre para el boton
    var name: String
    //array bool para los grupos musculares
    @State var menuBool = [Bool]()
    //array para los ejercicios de cara grupo
    @State var arrayModel: [Exercise]
    
    var body: some View{
        Button(action: {
            //agrega ejercicios al array model
            exercisesMockData()
        }, label: {
            Text(name)
                .foregroundColor(Color.white)
                .frame(width: 200, height: 50)
                .background(Color.blue)
                .cornerRadius(8)
        })
    }
    func exercisesMockData(){
        arrayModel.append(Exercise(name: "Bench Press", muscleGroup: "Chest"))
        arrayModel.append(Exercise(name: "Lower Bench Press", muscleGroup: "Chest"))
    }
    func menuBools(){
        
    }
}


struct ExercisesView_Previews: PreviewProvider {
    @State var chest : [Exercise]
    @State var menuBool : [Bool]
    
    static var previews: some View {
        ExercisesView()
    }
}
