//
//  WorkoutView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-07.
//

import SwiftUI

struct ShowWorkoutView: View {
    @State var restTime = 0
    var entryName: String
    var list: [Exercise]
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    /*var date : String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: <#T##Date#>)
    }*/
    @State var timerCountDown = 10
    @State var timerRunning = false
    
    var body: some View {
        VStack{
            //MARK: rest time bar
            HStack{
                Spacer(minLength: 25)
                Text("Rest time: ")
                /*Button(action: {
                    
                }, label: {
                    TextField("Rest inbetwen sets", text: $restTime).keyboardType(.numberPad)
                })*/
                TextField("Rest inbetwen sets", value: $restTime, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            /*VStack{
                //esto necesita boton que cambie el running a true y boton que cambie el cowntdown a el tiempo deseado
                Text("\(timerCountDown)")
                    .onReceive(timer){ _ in
                        //si el timer mayor que cero y running, decrease countDown(restTime)
                        if timerCountDown > 0 && timerRunning{
                            timerCountDown -= 1
                        }else{
                            //Si no, para el timer
                            timerRunning = false
                        }
                    }
                    .font(.system(size: 20, weight: .bold))
                    .opacity(0.80)
            }*/
            //MARK: List with rows for every workout
            List(){
                ForEach(list, id: \.id) { exercise in
                    VStack (alignment: .center){
                        WorkoutCellView(exercise: exercise, restTime: $restTime)
                            .cornerRadius(25)
                        /*Text("Define SetRow")
                        RoundedRectangle(cornerRadius: 50).fill(.gray)
                            .frame(width: 350, height: 60)*/
                    }
                }
                .padding(-5)
            }
            .padding(-15)
        }
        .navigationTitle("\(entryName)") //the name of the workoutentry from user list
    }
}

/*struct WorkoutView_Previews: PreviewProvider {
    @EnvironmentObject var viewModel: AppViewModel
    var entry = Workout(name: "Preview", sets: 3, repetitions: 10)
    
    static var previews: some View {
        WorkoutView(workoutEntry: entry )
            .environmentObject(AppViewModel())
    }
}*/
