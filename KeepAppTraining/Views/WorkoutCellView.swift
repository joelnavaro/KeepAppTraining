//
//  WorkoutCellView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-11.
//

import SwiftUI

struct WorkoutCellView: View {
    var exercise : Exercise
    @Binding var restTime : Int //needs to be state cause its gonna decrease
    //have to change the state rest time, it only reads the first Int, gonna usecountdown instead
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timerCountDown = 0
    @State var timerRunning = false
    
    
    
    var body: some View {
        ZStack{
            Color.blankSpace
            VStack{
                VStack{
                    Text("\(timerCountDown)")
                        .onReceive(timer){ _ in
                            if timerCountDown > 0 && timerRunning{
                                timerCountDown -= 1
                            }else{
                                timerRunning = false
                            }
                        }
                        .font(.system(size: 20, weight: .bold))
                        .opacity(0.80)
                }
                HStack{
                    Text("\(exercise.name)")
                    Text("\(exercise.muscleGroup)")
                }
                HStack{
                    Text("\(exercise.sets)")
                    Text("\(exercise.repetitions)")
                }
                VStack{
                    Text("Animation")
                    Button(action: {
                        timerCountDown = restTime

                        timerRunning.toggle()
                    }, label: {
                        Image(systemName: "play.rectangle").font(.system(size: 40))
                    }).padding(.top, 50)
                }
                
            }
        }.frame(width: 350, height: 250)
    }
}

/*struct WorkoutCellView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCellView(exercise: Exercise(name: "Test", muscleGroup: "Test", sets: 3, repetitions: 10))
    }
}*/
