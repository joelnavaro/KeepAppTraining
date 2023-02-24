import Foundation
import FirebaseAuth
import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

struct AddWorkoutView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @Environment(\.dismiss) private var dismiss
    @Binding var workoutList : [Workout]
    var exercisesList : [Exercise]
    @State var name = ""
    @State var itemsSelected = [Exercise]()
    @State var newWorkout = Workout()
    
    var body: some View {
        ZStack{
            Color.inApp2.ignoresSafeArea()
            VStack{
                ZStack{
                    Color.blankSpace
                    
                    TextField("Workout's name: ", text: $name)
                }
                .frame(width: 200, height: 50)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.blue, lineWidth: 2))
                .cornerRadius(10)
                .shadow(color: Color.black, radius: 3, x: 2)
                .padding(.top, 50)
                .padding(.bottom, 50)
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
                VStack{
                    List(){
                        Section{
                            ForEach(exercisesList){ exercise in
                                ZStack{
                                    WorkoutCellView(exercise: exercise, list: $itemsSelected)
                                }
                            }
                        }header: {
                            Text("Elegible Exercises.")
                        }
                    }
                    Button(action: {
                        addWorkout()
                    }, label: {
                        ButtonView(item: "Done", w: 90, h: 50)
                        
                    })
                }
                .navigationTitle("Exercises selected")
                .cornerRadius(10)
                .padding(10)
            }.onAppear(){
                viewModel.readExercisesFiresbase()
            }
        }
    }
    func addWorkout(){
        guard !name.isEmpty else {return}
        newWorkout.name = name
        newWorkout.exercisesList = itemsSelected
        
        workoutList.append(newWorkout)
        
        guard let user = viewModel.auth.currentUser else {return}
        do{
            _ = try viewModel.db.collection("users").document(user.uid).collection("workouts").addDocument(from: newWorkout)
        } catch {
            print("error saving to DB")
        }
        dismiss()
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
    
    struct WorkoutCellView: View{
        var exercise : Exercise
        @Binding var list: [Exercise]
        @State var isChecked = false
        
        var body: some View{
            HStack{
                Text(exercise.name)
                Spacer()
                Button(action: {
                    if !list.contains(exercise){
                        list.append(exercise)
                        isChecked.toggle()
                        print("name: \(exercise.name)")
                        print("name: \(String(describing: exercise.id))")
                    }else{
                        if let index = list.firstIndex(of: exercise) {
                            list.remove(at: index)
                            isChecked.toggle()
                            print("name: \(exercise.name)")
                            print("name: \(String(describing: exercise.id))")
                        }
                    }
                    print("preliminar has: \(list.count)")
                }, label: {
                    Image(systemName: isChecked ? "checkmark.square" : "square").font(.system(size: 30))
                })
            }
        }
    }
    
}

/*struct AddWorkoutView_Previews: PreviewProvider {
 @EnvironmentObject var viewModel: AppViewModel
 
 static var previews: some View {
 AddWorkoutView()
 .environmentObject(AppViewModel())
 }
 }*/
