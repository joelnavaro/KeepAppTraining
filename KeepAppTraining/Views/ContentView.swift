//
//  ContentView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-01-25.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore


struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    //este workout solo sale en contentview(), no en overview
    // CV es la app y lo demas son solo views
    //@StateObject var workout = Workout()
    
    var body: some View {
        VStack {
            NavigationView{
                if viewModel.userCreated{
                    VStack{
                        HomeView()
                        /*Button(action: {
                            viewModel.signOut()
                        }, label: {
                            Text("Sign Out")
                                .foregroundColor(Color.white)
                                .frame(width: 200, height: 50)
                                .background(Color.red)
                                .cornerRadius(8)
                                .padding()
                        })*/
                    }.onAppear(){
                        /*let a = Exercise(name: "Cable Triceps Pushdown", muscleGroup: "arms", sets: 8,repetitions: 8)
                        let b = Exercise(name: "Biceps curl", muscleGroup: "arms", sets: 8,repetitions: 8)
                        let c = Exercise(name: "Cable Chest Flys", muscleGroup: "chest", sets: 4,repetitions: 10)
                        let d = Exercise(name: "Incline Bench Press", muscleGroup: "chest", sets: 4,repetitions: 10)
                        let e = Exercise(name: "Back extension", muscleGroup: "back", sets: 4,repetitions: 6)
                        let f = Exercise(name: "Lat Pull-Down", muscleGroup: "back", sets: 4,repetitions: 6)
                        let g = Exercise(name: "Back Squat", muscleGroup: "legs", sets: 4,repetitions: 8)
                        let h = Exercise(name: "Front Squat", muscleGroup: "legs", sets: 4,repetitions: 8)
                        viewModel.saveToFirestore(exercise: a)
                        viewModel.saveToFirestore(exercise: b)
                        viewModel.saveToFirestore(exercise: c)
                        viewModel.saveToFirestore(exercise: d)
                        viewModel.saveToFirestore(exercise: e)
                        viewModel.saveToFirestore(exercise: f)
                        viewModel.saveToFirestore(exercise: g)
                        viewModel.saveToFirestore(exercise: h)*/
                    }
                }else{
                    SignInView()
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    @EnvironmentObject var viewModel: AppViewModel
    
    static var previews: some View {
        ContentView()
            .environmentObject(AppViewModel())
    }
}
