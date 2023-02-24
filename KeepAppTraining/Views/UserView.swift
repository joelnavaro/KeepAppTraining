
import SwiftUI
import PhotosUI

struct UserView: View {
    @ObservedObject var user : User
    var exercises : Int
    var workouts : Int
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
                            .resizable()
                            .scaledToFit()
                            .padding(20)
                            .frame(width: 150, height: 200)
                            .cornerRadius(64)
                            .background(Color.blankSpace.opacity(2))
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.blue, lineWidth: 3))
                            .shadow(color: Color.blue, radius: 5)
                            .foregroundColor(.blue.opacity(10))
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
                }
                VStack{
                    if let name = user.firstName{
                        Text("Name: \(name)")
                    }
                    Divider().padding(1)
                    Text("\(exercises) Exercises saved")
                    Divider().padding(1)
                    Text("\(workouts) Workouts saved")
                    Divider().padding(1)
                    Text("\(user.workoutCompleted) Workouts completed")
                    Divider().padding(1)
                }
                .frame(width: 160, height: 170)
                .background(Color.blankSpace.opacity(10), in: RoundedRectangle(cornerRadius: 20, style: .continuous))
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
