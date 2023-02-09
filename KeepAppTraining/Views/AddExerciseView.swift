//
//  AddExerciseView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-07.
//

import SwiftUI

struct AddExerciseView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State var name = ""
    @State var mGroup = ""
    @State var sets = ""
    @State var reps = ""
    @State var description = ""
    
    var exerciseList : [Exercise]
    
    var body: some View {
        ZStack{
            Color.testCard.ignoresSafeArea()
            VStack{
                ZStack{
                    Color.blankSpace
                        .frame(width: 200, height: 50)
                        .clipShape(Rectangle())
                        .overlay(Rectangle().stroke(Color.blue, lineWidth: 2))
                        .cornerRadius(10)
                        .shadow(color: Color.black, radius: 3, x: 2)
                        .padding(.top, 50)
                        .padding(.bottom, 50)
                    Text("Add exercise (Title)")
                }
    //MARK: Name and group
                HStack{
                    ZStack{
                        Color.blankSpace
                            .frame(width: 60, height: 30)
                            .clipShape(Rectangle())
                            .overlay(Rectangle().stroke(Color.blue, lineWidth: 2))
                            .cornerRadius(10)
                            .shadow(color: Color.black, radius: 3, x: 2)
                        Text("Name: ")
                    }
                    TextField("Name...", text: $name).background(Color.white)
                }
                .padding(10)
                HStack{
                    ZStack{
                        Color.blankSpace
                            .frame(width: 125, height: 30)
                            .clipShape(Rectangle())
                            .overlay(Rectangle().stroke(Color.blue, lineWidth: 2))
                            .cornerRadius(10)
                            .shadow(color: Color.black, radius: 3, x: 2)
                        Text("Muscle Group: ")
                    }
                    TextField("Muscle Group...", text: $mGroup).background(Color.white)
                }
                .padding(10)
    //MARK: Sets and Reps
                HStack{
                    ZStack{
                        Color.blankSpace
                            .frame(width: 60, height: 30)
                            .clipShape(Rectangle())
                            .overlay(Rectangle().stroke(Color.blue, lineWidth: 2))
                            .cornerRadius(10)
                            .shadow(color: Color.black, radius: 3, x: 2)
                        Text("Sets: ")
                    }
                    TextField("Sets...", text: $sets).background(Color.white)
                    ZStack{
                        Color.blankSpace
                            .frame(width: 60, height: 30)
                            .clipShape(Rectangle())
                            .overlay(Rectangle().stroke(Color.blue, lineWidth: 2))
                            .cornerRadius(10)
                            .shadow(color: Color.black, radius: 3, x: 2)
                        Text("Reps: ")
                    }
                    TextField("Repetitions...", text: $reps).background(Color.white)
                }
                .padding(15)
    //MARK: Description
                ZStack {
                    Color.blankSpace
                        .frame(width: 150, height: 30)
                        .clipShape(Rectangle())
                        .overlay(Rectangle().stroke(Color.blue, lineWidth: 2))
                        .cornerRadius(10)
                        .shadow(color: Color.black, radius: 3, x: 2)
                    Text("Description:")
                }
                TextEditor(text: $description)
                    .frame(width: 350, height: 180)
                    .clipShape(Rectangle())//hace el frame circular
                    .overlay(Rectangle().stroke(Color.blue, lineWidth: 2))
                    .cornerRadius(10)
                    .shadow(color: Color.black, radius: 3, x: 2)
                Button(action: {
                    saveEntry()
                    dismiss()
                }, label:{
                    Text("Save")
                })
                Spacer()
                /*Color(red: 255/256, green: 255/256, blue: 255/256) //front
                 .blendMode(.colorBurn)
                 .frame(width: 60, height: 35)
                 .background(Color(red: 255/256, green: 255/256, blue: 255/256))
                 //.rotationEffect(.degrees(45))
                 .cornerRadius(20)*/
            }
        }
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.never)
    }//body
    
    func saveEntry(){
        // if fields name, group and description are not empty
        guard !name.isEmpty, !mGroup.isEmpty, !description.isEmpty, !sets.isEmpty, !reps.isEmpty else {return}
        // if fields sets and reps are not empty and are not nil
        let newSet = Int(sets)
        let newReps = Int(reps)
        
        if let newSet = newSet, let newReps = newReps {
            let entry = Exercise(name: name, muscleGroup: mGroup, sets: newSet, repetitions: newReps, description: description)
            viewModel.user.exerciseList.append(entry)
        }
        print("\(viewModel.user.exerciseList.count)")
    }
    
}//addExerciseView

/*struct AddExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseView()
    }
}*/