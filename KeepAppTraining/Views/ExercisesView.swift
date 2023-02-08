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
    //MARK: list for the buttonsview
    @State var exerciseList : [Exercise] = []
    @State var nextPage = false
    
    var body: some View{
        //Text(exercise.name)
        ZStack{
            Color.inApp2.ignoresSafeArea()
            ScrollView{
                VStack{
                    HStack(){
                        Spacer(minLength: 2)
    //MARK: SHOWS BUTTONS FOR THE EXERCISE MENU
                        ForEach(buttonsMenu, id: \.self){ item in
                            Button(action: {
                                exerciseList = showStandardList(from: viewModel, group: item)
                            }){ ButtonView(item: item, w: 80, h: 50)}
                        }
                        .padding(3)
                        Spacer(minLength: 2)
                    }//Hstack
    //MARK: shows user list
                    VStack{
                        Divider().padding(8)//linea divisoria
                        Text("Create a customized view for every cell")
                        Divider().padding(8)//linea divisoria
    //MARK: CHANGE FOR SHOWUSERLIST() WHEN APP READY TO SHOW
                        List(){
                            ForEach(exerciseList){ exercise in
                                NavigationLink(destination: CellView(name: exercise.name, muscleGroup: exercise.muscleGroup), label: {Text(exercise.name)})
                            }
                            .onDelete(){ indexSet in
                                viewModel.deleteStandardExercise(indexSet: indexSet)
                            }
                        }
                        .cornerRadius(25)
                        .padding(8)
                    }
                    .padding(2)
                    //needs a sheet to add exercises to a muscle group
                    Button(action: {
                        nextPage = true
                    }, label: {
                        ButtonView(item: "Add Exercise", w: 200, h: 50 )
                            //.foregroundColor(Color.white)
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
            exerciseList = showUserList(from: viewModel, group: buttonsMenu[0])}
        .sheet(isPresented: $nextPage){ //en este content se puede agregar un onDismiss: para que pase algo al cerrar el sheet
            //change for AddExerciseView() when created
            AddExercise()
        }
        //navigationview
    }//body
    //MARK: shows user list for mail user
    func showUserList(from model: AppViewModel, group: String)->[Exercise]{
        var list = [Exercise]()
        
        for exercise in model.user.exerciseList{
            if exercise.muscleGroup == group{
                list.append(exercise)
            }
        }
        return list
    }
    //MARK: shows standard list for annon user
    func showStandardList(from model: AppViewModel, group: String)->[Exercise]{
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
        for exercise in model.standardExerciseList{
            if exercise.muscleGroup == group{
                list.append(exercise)
            }
        }
        print("exercises: \(model.standardExerciseList.count)")
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
    var w: CGFloat
    var h: CGFloat
    var w1: CGFloat = 1.33
    var h1: CGFloat = 1.43
    
    var body: some View {
        ZStack{
            Color.appButtons //back 80 50
                .frame(width: w, height: h)
                .cornerRadius(10)
                .shadow(color: Color.black, radius: 3, x: 5)
            Color(red: 255/256, green: 255/256, blue: 255/256) //front
                .blendMode(.colorBurn)
                .frame(width: w/w1, height: h/h1) //60 35
                .background(Color(red: 255/256, green: 255/256, blue: 255/256))
                //.rotationEffect(.degrees(45))
                .cornerRadius(20)
            Text("\(item)")
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

