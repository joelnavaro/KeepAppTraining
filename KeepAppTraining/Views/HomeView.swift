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

struct HomeView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @State var completedWorkout = 0
    
    var body: some View{
        NavigationView{
            ZStack{
                Color.inApp.ignoresSafeArea()
                VStack(spacing: 8){
                    UserView(user: viewModel.user, exercises: viewModel.standardExerciseList.count,
                             workouts: viewModel.standardWorkoutsList.count)
                    //.border(Color.blue, width: 3)
                    Spacer()
                    //MARK: Workout List
                    VStack{
                        List(){
                            Section{
                                ForEach(viewModel.standardWorkoutsList){ workout in
                                    if let name = workout.name{
                                        NavigationLink(destination: ShowWorkoutView(entryName: name, list: workout.exercisesList, done: $completedWorkout),
                                                       label: { CellView(name: name, extra: workout.exercisesList.count)
                                        })
                                    }
                                }.onDelete(){ indexSet in
                                    viewModel.deleteWorkoutInDb(indexSet: indexSet)
                                }
                                .listRowBackground(Color.blankSpace)
                            }header: {
                                Text("List with all workouts.")
                            }
                        }
                        
                    }
                    .cornerRadius(25)
                    .padding(10)
                    
                    HStack{
                        NavigationLink(destination: ExercisesView(list: viewModel.standardExerciseList), label: {
                            ButtonView(item: "Exercises", w: 180, h: 50)
                        }).padding(2)
                        NavigationLink(destination: AddWorkoutView(workoutList: $viewModel.standardWorkoutsList, exercisesList: viewModel.standardExerciseList),
                                       label: {
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
            viewModel.readWorkoutsFiresbase()
            viewModel.readExercisesFiresbase()
            
            if completedWorkout == 1 {
                viewModel.user.workoutCompleted += 1
            }
            if Auth.auth().currentUser == nil {
                viewModel.signInAnonymously()
            }
            guard let user = Auth.auth().currentUser?.uid else {return}
            print(user)
            //print("exercises: \(viewModel.standardExerciseList.count), HomeView")
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
