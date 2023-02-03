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
    var buttonsMenu = ["Arms", "Chest"]
    var buttonsMenu2 = ["Back", "Legs"]
    @StateObject var workoutModel = Workout()
    
    var body: some View{
        //Text(exercise.name)
            ZStack{
                Color(red: 175/256, green: 230/256, blue: 245/256)
                    .ignoresSafeArea()
            ScrollView{
                VStack{
                    HStack{
                        ForEach(buttonsMenu, id: \.self){ item in
                            Button(action: {}){
                                ButtonView(item: item)
                            }
                        }
                        .padding(8)
                    }
                    HStack{
                        ForEach(buttonsMenu2, id: \.self){ item in
                            Button(action: {}){
                                ButtonView(item: item)
                            }
                        }
                        .padding(8)
                    }//Hstack
                    Divider().padding(8)//linea divisoria
                    Text("Here goes a list with content from the Buttons above")
                    Divider().padding(8)//linea divisoria
                    List(){
                        Section(content: {}, header: {Text("Arms")}){
                            ForEach(workoutModel.exercisesList) { exercise in
                                Text(exercise.muscleGroup)
                            }
                        }
                    }
                    .cornerRadius(25)
                    .padding(8)
                    List(workoutModel.exercisesList) {
                        Text($0.name)
                    }
                    .cornerRadius(25)
                    .padding(8)
                    //needs a sheet to add exercises to a muscle group
                    Button(action: { }, label: {
                        Text("Add Exercise")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                    })//Button add exercise
                }//Vstack
                .frame(height: 750)
                .navigationTitle("Exercises")
            }
                //.background(Color(.init(white: 2, alpha: 0.05)))
            }//scrollview
        //navigationview
    }//body
    
}//struct
/*struct ExerciseButton: View {
    //nombre para el boton
    var name: String
    //array bool para los grupos musculares
    @State var menuBool = [Bool]()
    //array para los ejercicios de cara grupo
    @State var arrayModel: [Exercise]
    //@StateObject var workoutModel = Workout()
    
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
}*/


struct ExercisesView_Previews: PreviewProvider {
    @State var chest : [Exercise]
    @State var menuBool : [Bool]
    
    static var previews: some View {
        ExercisesView()
    }
}

struct ButtonView: View {
    var item: String
    var width1: Int?
    var width2: Int?
    
    var body: some View {
        ZStack{
            Color(red: 72/256, green: 181/256, blue: 216/256)
                .frame(width: 100, height: 50)
                .cornerRadius(10)
                .shadow(color: Color.gray, radius: 5, x: 5)
            Color(red: 255/256, green: 255/256, blue: 255/256)
                .blendMode(.colorBurn)
                .frame(width: 70, height: 35)
                .background(Color(red: 255/256, green: 255/256, blue: 255/256))
                //.rotationEffect(.degrees(45))
                .cornerRadius(20)
            Text("\(item)")
            
            //list colors
            /*Color(red: 242/256, green: 242/256, blue: 247/256)
                .frame(width: 100, height: 50)
                .background((Color(red: 242/256, green: 242/256, blue: 247/256)).opacity(2))
                .cornerRadius(10)
                .shadow(color: Color.gray, radius: 5, x: 5)
            
            Color(red: 255/256, green: 255/256, blue: 255/256)
                .blendMode(.colorBurn)
                .frame(width: 70, height: 35)
                .background(Color(red: 255/256, green: 255/256, blue: 255/256))
                .cornerRadius(20)*/
        }
    }
}
