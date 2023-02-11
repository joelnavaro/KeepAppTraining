//
//  AddWorkoutView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-07.
//

import SwiftUI

struct AddWorkoutView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        ZStack{
            Color.inApp2.ignoresSafeArea()
            VStack{
                Text("All the components to add to the object")
                VStack{
                    Text("List with all the exercises with a box to choose")
                    Text("Un boton para save")
                }
            }
            
        }
    }
}

struct AddWorkoutView_Previews: PreviewProvider {
    @EnvironmentObject var viewModel: AppViewModel
    
    static var previews: some View {
        AddWorkoutView()
            .environmentObject(AppViewModel())
    }
}
