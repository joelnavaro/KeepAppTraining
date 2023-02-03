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
struct OverviewView: View {
    @EnvironmentObject var viewModel: AppViewModel
    //var workout : Workout? = nil
    @StateObject var workoutModel = Workout()
    @State var nextPage = false
    
    var body: some View{
        NavigationView{
            ZStack{
                Color(red: 175/256, green: 230/256, blue: 245/256)
                    .ignoresSafeArea()
                VStack(spacing: 8){
                    HStack{
                        Image(systemName: "person.fill")
                            .resizable()//habilita cambiar de tamano
                            .scaledToFit()//escala la imagen
                            .padding(20)//antes de frame es para la imagen, despes, para el frame
                            .frame(width: 150, height: 200)//define el tamano
                            .cornerRadius(64)
                            .background(Color.gray.opacity(2))
                            .clipShape(Circle())//hace el frame circular
                            .overlay(Circle().stroke(Color.blue, lineWidth: 3))//pinta borde
                            .shadow(color: Color.blue, radius: 5)//pinta sombra
                            .foregroundColor(.blue.opacity(10))//pinta el icono
                        //.font(.system(size: 64))
                        VStack{
                            Text("User Name")
                            Text("Some Other info")
                        }
                        .frame(width: 128, height: 128)
                        .cornerRadius(64)
                        .padding(8)
                        Spacer()
                    }
                    .overlay(RoundedRectangle(cornerRadius: 64)
                        .stroke(Color.blue, lineWidth: 3))
                    .padding(8)
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
                    .padding(5)
                    .cornerRadius(25)
                    HStack{
                        NavigationLink(destination: ExercisesView(), label: {
                            Text("Exercises")
                                .foregroundColor(Color.white)
                                .frame(width: 180, height: 50)
                                .background(Color.blue)
                                .cornerRadius(8)
                        })
                        .padding(2)
                        Button(action: {
                            
                        }, label: {
                            Text("Create Workout")
                                .foregroundColor(Color.white)
                                .frame(width: 180, height: 50)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }).padding(2)
                    }
                    .cornerRadius(10)
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
        .navigationTitle("Overview")
        .onAppear(){
            print("exercise list: \(workoutModel.exercisesList.count)")
            if Auth.auth().currentUser == nil {
                //viewModel.signedIn = true
                viewModel.signInAnonymously()
            }
            guard let user = Auth.auth().currentUser?.uid else{return}
            print(user)
        }
    }
}

struct OverviewView_Previews: PreviewProvider {
    @StateObject var model : Workout
    
    static var previews: some View {
        OverviewView()
    }
}
