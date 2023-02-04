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
    @EnvironmentObject var viewModel: AppViewModel
    //@State var chest = [Exercise]()
    var buttonsMenu = ["Arms", "Chest", "Back", "Legs"] //names on buttons
    //@StateObject var workoutModel = Workout() //un workout
    @State var exerciseList : [Exercise] = [] //lista para los botones
    @State var nextPage = false
    
    var body: some View{
        //Text(exercise.name)
        ZStack{
            Color(red: 175/256, green: 230/256, blue: 245/256)
                .ignoresSafeArea()
            ScrollView{
                VStack{
                    HStack{
                        Spacer(minLength: 2)
                        ForEach(buttonsMenu, id: \.self){ item in
                            Button(action: {
                                exerciseList = showList(from: viewModel, group: item)
                            }){ ButtonView(item: item)}
                        }
                        .padding(3)
                        Spacer(minLength: 2)
                    }//Hstack
                    VStack{
                        Divider().padding(8)//linea divisoria
                        Text("Create a customized view for every cell")
                        Text("Code the onDelete")
                        Divider().padding(8)//linea divisoria
                        List(){
                            ForEach(exerciseList){ exercise in
                                NavigationLink(destination: CellView(name: exercise.name, muscleGroup: exercise.muscleGroup), label: {Text(exercise.name)})
                            }
                            //.onDelete(perform: <#T##Optional<(IndexSet) -> Void>##Optional<(IndexSet) -> Void>##(IndexSet) -> Void#>)
                        }
                        .cornerRadius(25)
                        .padding(8)
                    }
                    .padding(2)
                    //needs a sheet to add exercises to a muscle group
                    Button(action: {
                        nextPage = true
                    }, label: {
                        Text("Add Exercise")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                    })//Button add exercise
                }//Vstack
                .frame(height: 750)
                .padding(2)
                .navigationTitle("Exercises")
            }//scrollv
            .padding(2)
            //.background(Color(.init(white: 2, alpha: 0.05)))
        }//zstack
        .onAppear(){
            exerciseList = showList(from: viewModel, group: buttonsMenu[0])}
        .sheet(isPresented: $nextPage){ //en este content se puede agregar un onDismiss: para que pase algo al cerrar el sheet
            AddExercise()
        }
        //navigationview
    }//body
    func showList(from model: AppViewModel, group: String)->[Exercise]{
        var list = [Exercise]()
        //for a list of workouts
        /*for workout in a.workoutList{
            for exercise in workout.exercisesList{
                if exercise.muscleGroup == group{
                    list.append(exercise)
                }
            }
        }*/
        //using a test workout created in appviewmodel
        for exercise in model.testWorkout.exercisesList{
            if exercise.muscleGroup == group{
                list.append(exercise)
            }
        }
        print("exercises: \(model.testWorkout.exercisesList.count)")
        print(exerciseList.count)
        print(list.count)
        return list
    }
}//struct
struct CellView: View{
    var name: String
    var muscleGroup: String
    
    var body: some View{
        Text(muscleGroup)
        Text(name)
    }
    func saveExercise(){
        
    }
}
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
struct AddExercise: View{
    var body: some View {
        VStack{
            Text("Add exercises to the model list in view model")
            Text("create a view to show exercises objects")
            Text("create NavBarTitle/NaviBarItems")
            Text("create func to save exercises")
            Text("if you want info from previous page, create a variable in the new page of the same type and a func that saves in this variable what you want to send back in the func that saves the exercise")
        }
        
    }
}
struct ButtonView: View {
    var item: String
    var width1: Int?
    var width2: Int?
    
    var body: some View {
        ZStack{
            Color(red: 72/256, green: 181/256, blue: 216/256) //back
                .frame(width: 80, height: 50)
                .cornerRadius(10)
                .shadow(color: Color.gray, radius: 5, x: 5)
            Color(red: 255/256, green: 255/256, blue: 255/256) //front
                .blendMode(.colorBurn)
                .frame(width: 60, height: 35)
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


struct ExercisesView_Previews: PreviewProvider {
    @EnvironmentObject var viewModel: AppViewModel
    
    static var previews: some View {
        ExercisesView()
            .environmentObject(AppViewModel())
    }
}

