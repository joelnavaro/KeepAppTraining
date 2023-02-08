//
//  AddExerciseView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-07.
//

import SwiftUI

struct AddExerciseView: View {
    @State var name = ""
    @State var mGroup = ""
    @State var sets = ""
    @State var reps = ""
    @State var description = ""
    
    var body: some View {
        ZStack{
            Color.testCard.ignoresSafeArea()
            VStack{
                Text("Add exercise (Title)")
                Spacer()
    //MARK: Name and group
                HStack{
                    Text("Name: ").background(Color.blankSpace).cornerRadius(10)
                    TextField("Name...", text: $name).background(Color.white)
                    Text("Muscle Group: ").background(Color.blankSpace).cornerRadius(10)
                    TextField("Muscle Group...", text: $mGroup).background(Color.white)
                }
                .padding(10)
    //MARK: Sets and Reps
                HStack{
                    Text("Sets: ").background(Color.blankSpace).cornerRadius(10)
                    TextField("Sets...", text: $sets).background(Color.white)
                    Text("Repetitions: ").background(Color.blankSpace).cornerRadius(10)
                    TextField("Repetitions...", text: $reps).background(Color.white)
                }
                .padding(15)
    //MARK: Description
                Text("Description:")
                TextField("Description...", text: $description)
                    .frame(width: 350, height: 180)
                    .background(Color.blankSpace)
                    .clipShape(Rectangle())//hace el frame circular
                    .overlay(Rectangle().stroke(Color.blue, lineWidth: 3))
                    .cornerRadius(10)
                    .shadow(color: Color.black, radius: 3, x: 2)
                Spacer()
                /*Color(red: 255/256, green: 255/256, blue: 255/256) //front
                 .blendMode(.colorBurn)
                 .frame(width: 60, height: 35)
                 .background(Color(red: 255/256, green: 255/256, blue: 255/256))
                 //.rotationEffect(.degrees(45))
                 .cornerRadius(20)*/
            }
        }
    }
}

struct AddExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseView()
    }
}
