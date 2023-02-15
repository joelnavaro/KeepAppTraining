//
//  OverviewView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-01.
//

import SwiftUI

import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
//podria llamarse MainView
struct HomeView: View {
    @EnvironmentObject var viewModel: AppViewModel
    //workout model to show in HomeView
    //var workoutModel = [Workout]()
    @State var nextPage = false
    
    var body: some View{
        NavigationView{
            ZStack{
                Color.inApp.ignoresSafeArea()
                VStack(spacing: 8){
                    UserView(user: viewModel.user)
                    //.border(Color.blue, width: 3)
                    Spacer()
    //MARK: list with workoutlist from user
                    VStack{
                        List(){
                            //ForEach(viewModel.user.workoutList){ entry in also changed ondelete
                            ForEach(viewModel.standardWorkoutsList){ workout in
                                if let name = workout.name{
                                    NavigationLink(destination: ShowWorkoutView(entryName: name, list: workout.exercisesList), label: {
                                        if let name = workout.name{
                                            CellView(name: name)
                                        }
                                    })
                                }
                            }.onDelete(){ indexSet in
                                viewModel.deleteStandardWorkout(at: indexSet)
                                viewModel.deleteWorkoutInDb(indexSet: indexSet)
                                //viewModel.deleteUserWorkout(at: indexSet)  en users list
                                //need to create database for workout first
                                //viewModel.deleteFromDb(indexSet: indexSet, list: <#T##[Exercise]#>)
                            }
                            .listRowBackground(Color.blankSpace)
                        }
                    }
                    .cornerRadius(25)
                    .padding(10)
                    .onAppear(){
                        //update list
                    }
                    HStack{
                        NavigationLink(destination: ExercisesView(list: viewModel.standardExerciseList), label: {
                            ButtonView(item: "Exercises", w: 180, h: 50)
                        }).padding(2)
                        NavigationLink(destination: AddWorkoutView(workoutList: $viewModel.standardWorkoutsList, exercisesList: viewModel.standardExerciseList), label: {
                            ButtonView(item: "Create Workout", w: 180, h: 50)
                        }).padding(2)
                    }
                    Button(action: {
                        viewModel.signOut()
                    }, label: {
                        Text("Sign Out")
                            .foregroundColor(Color.white)
                            .frame(width: 250, height: 35)
                            .background(Color.red)
                            .cornerRadius(8)
                    })
                }
            }
        }
        .onAppear(){
            //print("exercise list: \(workoutModel.exercisesList.count)")
            if Auth.auth().currentUser == nil {
                //viewModel.signedIn = true
                viewModel.signInAnonymously()
            }
            guard let user = Auth.auth().currentUser?.uid else{return}
            print(user)
            //print("exercises: \(viewModel.standardExerciseList.count), HomeView")
            //print("\(viewModel.user.workoutList.count): workouts in user workouts list")
        }
    }
}

struct OverviewView_Previews: PreviewProvider {
    @State var model : Workout
    
    static var previews: some View {
        HomeView()
            .environmentObject(AppViewModel())
    }
}
