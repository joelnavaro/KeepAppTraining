
import SwiftUI

struct WorkoutCellView: View {
    var exercise : Exercise
    @Binding var restTime : Int 
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timerCountDown = 30
    @State var timerRunning = false
    @State private var animationAmmount = 1.0
    @State private var animPauseBtn = 0.0
    @State var training = false
    @State var setsCounter = 0
    @State var repsCounter = 0
    @State var isCompleted = false
    @Binding var completed : Int
    
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
                        //logic()
                        withAnimation{
                            training.toggle()
                        }
                    }, label: {
                        Image(systemName: timerRunning ? "hand.raised.fill" : "figure.strengthtraining.traditional").font(.system(size: 40))
                            .clipShape(Rectangle())
                            .overlay(
                                Rectangle()
                                    .stroke(.blue)
                                    .scaleEffect(training ? 2 : 1)
                                    .opacity(2-animationAmmount)
                                    .animation(
                                        .easeInOut(duration: 1)
                                        .repeatForever(autoreverses: true), value: training ? 2 : 1)
                            )
                    })
                    HStack{
                        if timerCountDown == 0 && repsCounter < exercise.repetitions{
                            Text("Reps done: ")
                            ForEach(0..<repsCounter, id: \.self){_ in
                                Text("🏋️‍♂️")//.animation(.easeInOut(duration: 2))
                            }
                        }
                    }
                    if setsCounter < exercise.sets && setsCounter != 0{
                        ForEach(0..<setsCounter, id: \.self){_ in
                            Text("Sets done: 🥇")
                        }
                    }else if isCompleted{
                        Text("Exercise Completed 🏆")
                    }
                }
            }
        }.frame(width: 350, height: 250)
        HStack{
            //animation for resting
            if !isCompleted{
                Button(action: {
                    timerCountDown = restTime
                    withAnimation{
                        timerRunning.toggle()
                        animPauseBtn += 360
                    }
                    repsCounter += 1
                    logic()
                }, label: {
                    Image(systemName: timerRunning ? "pause.rectangle" : "play.rectangle").font(.system(size: 30))
                        .clipShape(Rectangle())
                        .rotation3DEffect(.degrees(animPauseBtn), axis: (x: 0, y: 1, z: 0))
                }).padding(8)
                
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
                    .scaleEffect(timerRunning ? 2 : 1)
                    .animation(.easeInOut, value: 1)
                    .padding(.trailing, 50)
            }else{
                Text("Completed 🏆").font(.system(size: 30))
            }
        }
    }
    func logic(){
        if repsCounter == exercise.repetitions{
            setsCounter += 1
            repsCounter = 0 //when a set is completed turn sets to 0
        }else if setsCounter == exercise.sets{ //when exercise completed
            isCompleted = true
            completed += 1
        }
    }
}

/*struct WorkoutCellView_Previews: PreviewProvider {
 static var previews: some View {
 WorkoutCellView(exercise: Exercise(name: "Test", muscleGroup: "Test", sets: 3, repetitions: 10))
 }
 }*/
