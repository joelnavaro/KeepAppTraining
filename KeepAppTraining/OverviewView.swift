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

struct OverviewView: View {
    @EnvironmentObject var viewModel: AppViewModel
    //var workout : Workout? = nil
    @StateObject var workoutModel = Workout()
    @State var nextPage = false
    
    var body: some View{
        NavigationView{
            VStack{
                HStack{
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 128, height: 128)
                        .cornerRadius(64)
                        //.font(.system(size: 64))
                        .padding()
                }
                .overlay(RoundedRectangle(cornerRadius: 64).stroke(Color.blue, lineWidth: 3))
                //.border(Color.blue, width: 3)
                Spacer()
                VStack{
                    List(){
                        ForEach(workoutModel.workoutsList){ workout in
                            if let name = workout.name{
                                Text(name)
                            }
                        }
                    }
                }
                HStack{
                    Button(action: {
                        //ExercisesView()
                        //.navigate(to: ExercisesView(), when: $nextPage)
                        //this action needs a func in viewmodel that sends me to exercisesView()
                    }, label: {
                        Text("Exercises")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                    })
                    //NavigationLink(destination: <#T##() -> View#>, label: <#T##() -> View#>)
                    Button(action: {
                        
                    }, label: {
                        Text("Create Workout")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                    })
                }.padding()
            }.padding()
        }
        .navigationTitle("Overview")
        .background(Color(.init(white: 0, alpha: 0.05)))
        .onAppear(){
            print(workoutModel.exercisesList.count)
        }
    }
}

struct OverviewView_Previews: PreviewProvider {
    @StateObject var model : Workout
    
    static var previews: some View {
        OverviewView()
    }
}
