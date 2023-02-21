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
    @State var timerCountDown = 30
    @State var timerRunning = false
    @State private var animationAmmount = 1.0
    @State private var animPause = 0.0
    @State var training = false
    @State var setsCounter = 0
    @State var repsCounter = 0
    @State var exerciseCompleted = false
    
    var body: some View {
        ZStack{
            Color.blankSpace
            VStack{
                HStack{
                    Text("✏️ \(exercise.name)")
                    Text("💪 \(exercise.muscleGroup.capitalized)")
                }
                HStack{
                    Text("📋 \(exercise.sets) Sets")
                    Text(" \(exercise.repetitions) Repetitions")
                }
                VStack{                    //animation for training
                    Button(action: {
                        setsCounter += 1
                        if setsCounter == exercise.sets{ //when exercise completed
                            exerciseCompleted = true
                        }
                        repsCounter = 0 //when a set is completed turn sets to 0
                        
                        if training{ //animation for the button
                            animationAmmount = 2.0
                        }else{
                            animationAmmount = 1.0
                        }
                        training.toggle()
                    }, label: {
                        Image(systemName: timerRunning ? "hand.raised.fill" : "figure.strengthtraining.traditional").font(.system(size: 40))
                            .clipShape(Rectangle())
                            .overlay(
                                Rectangle()
                                    .stroke(.blue)
                                    .scaleEffect(1.0)
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
                    HStack{ //si timer=0 y reps menor que ejerReps, print an icon
                        if timerCountDown == 0 && repsCounter < exercise.repetitions{
                            Text("Reps done: ")
                            ForEach(0..<repsCounter, id: \.self){_ in
                                Text("🏋️‍♂️")
                            }
                        }
                    }
                    //si sets menor que ejerSets y sets no es 0, imprime un set completed
                    if setsCounter < exercise.sets && setsCounter != 0{
                        ForEach(0..<setsCounter, id: \.self){_ in
                            Text("Sets done: 🥇")
                        }
                    }else if setsCounter == exercise.sets{ //todas las sets hechas
                        Text("Exercise Completed 🏆")
                    }
                }
            }
        }.frame(width: 350, height: 250)
        HStack{
            //animation for resting
            Button(action: {
                timerCountDown = restTime //iguala timer a rest time
                timerRunning.toggle() //timer run = true
                withAnimation{
                    animPause += 360
                }
                animationAmmount = 0.0
                repsCounter += 1  //aumenta un rep cuando clickes
            }, label: {
                Image(systemName: timerRunning ? "pause.rectangle" : "play.rectangle").font(.system(size: 30))
                    .clipShape(Rectangle())
                    .rotation3DEffect(.degrees(animPause), axis: (x: 0, y: 1, z: 0))
            }).padding(15)
            Spacer()
            Text("⏱ \(timerCountDown)") //timer
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
