//
//  CellView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-11.
//

import SwiftUI

struct CellView: View{
    var name: String
    var muscleGroup: String?
    
    var body: some View{
        HStack{
            Text(name.capitalized)
            Spacer()
            if let group = muscleGroup{
                Text(group.capitalized)
            }else{
                Text("")
            }
        }
    }
}

struct CellView_Previews: PreviewProvider {
    @EnvironmentObject var viewModel: AppViewModel

    
    static var previews: some View {
        CellView(name: "Test Workout")
            .environmentObject(AppViewModel())
    }
}
