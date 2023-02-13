import Foundation
import FirebaseAuth
import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

struct AddWorkoutView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @Environment(\.dismiss) private var dismiss
    
    //@State var name = ""
    @State var isChecked : Bool = false
    @State var itemsSelected = [Exercise]()
    @State var newWorkout = Workout(name: "")
    //var standardList : [Exercise]   
    
    var body: some View {
        ZStack{
            Color.inApp2.ignoresSafeArea()
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
                    Text("Add Workout (Title)")
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
                    //TextField("Name...", text: $name).background(Color.white)
                    TextField("Name...", text: $newWorkout.name).background(Color.white)
                }
                .padding(10)
                VStack{
                    List(){
                        //ForEach(viewModel.standardExerciseList) { exercise in
                        ForEach(newWorkout.exercisesList) { exercise in
                            HStack{
                                Text(exercise.name)
                                Spacer()
                                Button(action: {
                                    //select(item: exercise)
                                    //exercise.isSelected.toggle()
                                }, label: {
                                    Image(systemName: exercise.isSelected ? "checkmark.square" : "square")
                                })
                            }
                        }
                        .listRowBackground(Color.blankSpace)
                    }
                    Button(action: {
                        addWorkout()
                    }, label: {
                        Text("Done")
                    })
                }
                //.navigationTitle("\(selectedRows.count) Exercises selected")
                .navigationTitle("Exercises selected")
                .cornerRadius(10)
                .padding(10)
            }.onAppear(){
                newWorkout.exercisesList = viewModel.standardExerciseList
            }
        }
    }
    func addWorkout(){
        viewModel.user.workoutList.append(newWorkout)
        dismiss()
        print("Model has: \(viewModel.user.workoutList.count)")
        for n in viewModel.user.workoutList{
            print("lists have: \(n.exercisesList.count) exercises")
        }
    }
    
    func select(item: Exercise){
        if !itemsSelected.contains(item){
            //item.isSelected = true
            itemsSelected.append(item)
        }else{
            itemsSelected.removeAll(where: {viewModel.standardExerciseList.contains($0)})
        }
        print("preliminar has: \(itemsSelected.count)")
    }
    
}

/*struct AddWorkoutView_Previews: PreviewProvider {
    @EnvironmentObject var viewModel: AppViewModel
    
    static var previews: some View {
        AddWorkoutView()
            .environmentObject(AppViewModel())
    }
}*/
