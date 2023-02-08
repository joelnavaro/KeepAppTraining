//
//  AddExerciseView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-07.
//

import SwiftUI

struct AddExerciseView: View {
    var body: some View {
        ZStack{
            Color(red: 72/256, green: 181/256, blue: 216/256) //back
                .frame(width: 80, height: 50)
                .cornerRadius(10)
                .shadow(color: Color.gray, radius: 5, x: 5)
            Color(red: 255/256, green: 255/256, blue: 255/256) //front
                .blendMode(.colorBurn)
                .frame(width: 60, height: 35)
                .background(Color(red: 255/256, green: 255/256, blue: 255/256))
            //.rotationEffect(.degrees(45))
                .cornerRadius(20)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct AddExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseView()
    }
}
