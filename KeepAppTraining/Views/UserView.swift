//
//  UserView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-15.
//

import SwiftUI

struct UserView: View {
    var user : User
    @State var name = ""
    var age = 0
    var workouts = 0
    
    var body: some View {
        ZStack{
            Color.blankSpace
                .frame(width: 350, height: 200)
                .cornerRadius(64)
            HStack{
                if user.profilePicture == nil{
                    Image(systemName: "person.fill")
                        .resizable()//habilita cambiar de tamano
                        .scaledToFit()//escala la imagen
                        .padding(20)//antes de frame es para la imagen, despes, para el frame
                        .frame(width: 150, height: 200)//define el tamano
                        .cornerRadius(64)
                        .background(Color.blankSpace.opacity(2))
                        .clipShape(Circle())//hace el frame circular
                        .overlay(Circle().stroke(Color.blue, lineWidth: 3))//pinta borde
                        .shadow(color: Color.blue, radius: 5)//pinta sombra
                        .foregroundColor(.blue.opacity(10))//pinta el icono
                    //.font(.system(size: 64))
                }else{
                    if let image = user.profilePicture{
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 100, height: 100)
                    }
                }
                VStack{
                    Text("Name: \(name)")
                    Text("X Worouts done")
                    Text("X Exercises saved")
                    Text("X Workouts completed")
                }
                .frame(width: 150, height: 170)
                .background(Color.blankSpace.opacity(10))
                .cornerRadius(40)
                .padding(8)
                Spacer()
            }
        }
    }
}

/*struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}*/
