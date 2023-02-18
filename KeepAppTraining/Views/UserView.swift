//
//  UserView.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-15.
//

import SwiftUI
import PhotosUI

struct UserView: View {
    @StateObject var user : User
    //@State var name = ""
    //var age = 0
    //var workouts = 0
    @State var selectedItems : [PhotosPickerItem] = []
    @State var data : Data?
    
    var body: some View {
        ZStack{
            Color.blankSpace
                .frame(width: 350, height: 200)
                .cornerRadius(64)
            HStack{
                ZStack{
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
                                .frame(width: 150, height: 200)
                                .cornerRadius(64)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.blue, lineWidth: 3))
                                .shadow(color: Color.blue, radius: 5)
                        }
                    }
                    /*VStack{
                        if let data = data,
                            let uiimage = UIImage(data: data){ //convierte a uiimage
                            Image(uiImage: uiimage).resizable() //haz un image view con el uiimage
                        }
                    }*/
                    PhotosPicker(
                        selection: $selectedItems,
                        maxSelectionCount: 1,
                        matching: .images,
                        photoLibrary: .shared()
                    ){
                        Image(systemName: "photo.on.rectangle.angled").font(.system(size: 20)).foregroundColor(Color.black)
                            .padding(.leading, 100)
                            .padding(.top, 100)
                    }
                    .onChange(of: selectedItems){ newValue in
                        guard let item = selectedItems.first else {return}
                        item.loadTransferable(type: Data.self){ result in
                            switch result{
                            case .success(let data):
                                if let data = data{
                                    //self.data
                                    DispatchQueue.main.async{
                                        user.profilePicture = UIImage(data: data)
                                    }
                                }else{
                                    print("Data is nil")
                                }
                            case .failure(let failure):
                                fatalError("\(failure)")
                            }
                        }
                    }
                    /*Button(action: {
                        //Picker that allows to select a different picture and shows in user picture
                    }, label: {
                        Image(systemName: "photo.on.rectangle.angled").font(.system(size: 20)).foregroundColor(Color.black)
                    }).padding(.leading, 100)
                        .padding(.top, 100)*/
                    
                }
                VStack{
                    if let name = user.firstName{
                        Text("Name: \(name)")
                    }
                    Text("\(user.workoutCompleted) Worouts done")
                    Text("\(user.exercisesCreated) Exercises saved")
                    Text("X Workouts completed")
                }
                .frame(width: 160, height: 170)
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
