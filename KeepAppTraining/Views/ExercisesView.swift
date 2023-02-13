import FirebaseAuth
import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ExercisesView: View{
    @EnvironmentObject var viewModel: AppViewModel
    //@State var chest = [Exercise]()
    var buttonsMenu = ["arms", "chest", "back", "legs"] //names on buttons
    //@StateObject var workoutModel = Workout() //un workout
    //MARK: list of exercises created onAppear
    @State var exerciseList : [Exercise] = []
    @State var addExerSheet = false
    
    var body: some View{
        //Text(exercise.name)
        ZStack{
            Color.inApp2.ignoresSafeArea()
            ScrollView{
                VStack{
                    //MARK: SHOWS BUTTONS FOR THE EXERCISE MENU
                    ScrollView(.horizontal){
                        HStack(){
                            ForEach(buttonsMenu, id: \.self){ item in
                                Button(action: {
                                    exerciseList = showStandardList(from: viewModel, group: item)
                                }){ ButtonView(item: item.capitalized, w: 80, h: 50)}
                            }
                            .padding(3)
                        }
                    }//ButtonsScrollView
                    //MARK: shows user list
                    VStack{
                        Divider().padding(8)//linea divisoria
                        Text("Filtered List")
                        Divider().padding(8)//linea divisoria
                        //MARK: PUT SHOWUSERLIST() instead WHEN APP READY TO SHOW
                        //-----------------------------------------------------------------------
                        List(){
                            ForEach(exerciseList){ exercise in
                                NavigationLink(destination: ShowExerciseView(exercise: exercise), label: {CellView(name: exercise.name, muscleGroup: exercise.muscleGroup)})
                                /*NavigationLink(destination: CellView(name: exercise.name, muscleGroup: exercise.muscleGroup), label: {Text(exercise.name)})*/
                            }
                            .onDelete(){ indexSet in
                                exerciseList.remove(atOffsets: indexSet)
                            }
                            .listRowBackground(Color.blankSpace)
                        }
                        .cornerRadius(25)
                        .padding(8)
                        //-----------------------------------------------------------------------
                        Text("Filtered List")
                        Divider().padding(8)
                        List(){
                            ForEach(viewModel.standardExerciseList){ exercise in
                                NavigationLink(destination: ShowExerciseView(exercise: exercise), label: {CellView(name: exercise.name, muscleGroup: exercise.muscleGroup)})
                                /*NavigationLink(destination: CellView(name: exercise.name, muscleGroup: exercise.muscleGroup), label: {Text(exercise.name)})*/
                            }
                            .onDelete(){ indexSet in
                                viewModel.deleteStandardExercise(indexSet: indexSet)
                            }
                            .listRowBackground(Color.blankSpace)
                        }
                        .cornerRadius(25)
                        .padding(8)
                    }
                    .padding(2)
                    
                    Button(action: {
                        addExerSheet.toggle()
                    }, label: {
                        ButtonView(item: "Add Exercise", w: 200, h: 50 )
                    })
                    
                }//Vstack
                .frame(height: 800)
                .padding(2)
                .navigationTitle("Exercises")
            }//scrollv
            .padding(2)
            //.background(Color(.init(white: 2, alpha: 0.05)))
        }//zstack
        .onAppear(){ //when this view starts, sorts a list and show
            exerciseList = showStandardList(from: viewModel, group: buttonsMenu[Int.random(in: 0...3)])
            print("\(viewModel.standardExerciseList.count)")
        }
        .sheet(isPresented: $addExerSheet){
            AddExerciseView(exerciseList: exerciseList)
        }
    }//body
    
    //MARK: shows standard list for annon user
    func showStandardList(from model: AppViewModel, group: String)->[Exercise]{
        var list = [Exercise]()
        //using a test workout created in appviewmodel
        for exercise in model.standardExerciseList{
            if exercise.muscleGroup == group{
                list.append(exercise)
            }
        }
        print("exercises: \(model.standardExerciseList.count)")
        print(exerciseList.count)
        print(list.count)
        return list
    }
}//struct

struct ButtonView: View {
    var item: String
    var w: CGFloat
    var h: CGFloat
    var w1: CGFloat = 1.33
    var h1: CGFloat = 1.43
    
    var body: some View {
        ZStack{
            Color.appButtons //back 80 50
                .frame(width: w, height: h)
                .cornerRadius(10)
                .shadow(color: Color.black, radius: 3, x: 5)
            Color(red: 255/256, green: 255/256, blue: 255/256) //front
                .blendMode(.colorBurn)
                .frame(width: w/w1, height: h/h1) //60 35
                .background(Color(red: 255/256, green: 255/256, blue: 255/256))
                //.rotationEffect(.degrees(45))
                .cornerRadius(20)
            Text("\(item)")
        }
    }
}


struct ExercisesView_Previews: PreviewProvider {
    @EnvironmentObject var viewModel: AppViewModel
    
    static var previews: some View {
        ExercisesView()
            .environmentObject(AppViewModel())
    }
}

