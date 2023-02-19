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
    @State private var animationAmmount = 0.0
    @State private var animPause = 0.0
    @State var enable = false
    
    var body: some View {
        ZStack{
            Color.blankSpace
            VStack{
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
                        if animationAmmount == 0.0{
                            animationAmmount = 1.0
                        }else{
                            animationAmmount = 0.0
                        }
                    }, label: {
                        Image(systemName: timerRunning ? "figure.wave" : "figure.strengthtraining.traditional").font(.system(size: 40))
                            .clipShape(Rectangle())
                            .overlay(
                                Rectangle()
                                    .stroke(.blue)
                                    .scaleEffect(animationAmmount)
                                    .opacity(2-animationAmmount)
                                    .animation(
                                        .easeInOut(duration: 1)
                                        .repeatForever(autoreverses: false),
                                        value: animationAmmount)
                            )
                            /*.onAppear{
                                animationAmmount = 2
                            }*/
                    })
                }
            }
        }.frame(width: 350, height: 250)
        HStack{
            Button(action: {
                timerCountDown = restTime
                timerRunning.toggle()
                withAnimation{
                    animPause += 360
                }
            }, label: {
                Image(systemName: timerRunning ? "pause.rectangle" : "play.rectangle").font(.system(size: 30))
                    .clipShape(Rectangle())
                    .rotation3DEffect(.degrees(animPause), axis: (x: 0, y: 1, z: 0))
            }).padding(15)
            Spacer()
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
    }
}

/*struct WorkoutCellView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCellView(exercise: Exercise(name: "Test", muscleGroup: "Test", sets: 3, repetitions: 10))
    }
}*/
