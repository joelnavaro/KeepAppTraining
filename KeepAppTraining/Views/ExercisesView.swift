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
                            ForEach(buttonsMenu, id: \.self){ type in
                                Button(action: {
                                    exerciseList = filterListByGroups(from: viewModel, group: type)
                                }){ ButtonView(item: type.capitalized, w: 80, h: 50)}
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
                            }
                            .listRowBackground(Color.blankSpace)
                        }
                        .cornerRadius(25)
                        .padding(8)
                        //-----------------------------------------------------------------------
                        Text("Full Exercises List")
                        Divider().padding(8)
                        List(){
                            ForEach(viewModel.standardExerciseList){ exercise in
                                NavigationLink(destination: ShowExerciseView(exercise: exercise), label: {CellView(name: exercise.name, muscleGroup: exercise.muscleGroup)})
                            }
                            .onDelete(){ indexSet in
                                viewModel.deleteInDb(indexSet: indexSet)
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
            //viewModel.dummyDbData()
            exerciseList = filterListByGroups(from: viewModel, group: buttonsMenu[Int.random(in: 0...3)])
            print("N Exercises: \(viewModel.standardExerciseList.count) ExerciseView")
        }
        .sheet(isPresented: $addExerSheet){
            AddExerciseView(exerciseList: exerciseList)
        }
    }//body
    
    //MARK: shows standard list
    func filterListByGroups(from model: AppViewModel, group: String)->[Exercise]{
        var list = [Exercise]()
        
        for exercise in model.standardExerciseList{
            if exercise.muscleGroup == group{
                list.append(exercise)
            }
        }
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

