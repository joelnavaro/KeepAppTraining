//
//  MyNotes.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-13.
//

import Foundation


//MARK: CONTENTVIEW

//under HomeView() a code for a signout
/*Button(action: {
    viewModel.signOut()
}, label: {
    Text("Sign Out")
        .foregroundColor(Color.white)
        .frame(width: 200, height: 50)
        .background(Color.red)
        .cornerRadius(8)
        .padding()
})*/


//MARK: APPVIEWMODEL

/*
 adds exercises with  isSelected to the first workout list
 
 firstWorkout.exercisesList.append(Exercise(name: "Cable Triceps Pushdown", muscleGroup: "arms", sets: 8,repetitions: 8, isSelected: false))
firstWorkout.exercisesList.append(Exercise(name: "Biceps curl", muscleGroup: "arms", sets: 8,repetitions: 8, isSelected: false))
firstWorkout.exercisesList.append(Exercise(name: "Cable Chest Flys", muscleGroup: "chest", sets: 4,repetitions: 10, isSelected: false))
firstWorkout.exercisesList.append(Exercise(name: "Incline Bench Press", muscleGroup: "chest", sets: 4,repetitions: 10, isSelected: false))
firstWorkout.exercisesList.append(Exercise(name: "Back extension", muscleGroup: "back", sets: 4,repetitions: 6, isSelected: false))
firstWorkout.exercisesList.append(Exercise(name: "Lat Pull-Down", muscleGroup: "back", sets: 4,repetitions: 6, isSelected: false))
firstWorkout.exercisesList.append(Exercise(name: "Back Squat", muscleGroup: "legs", sets: 4,repetitions: 8, isSelected: false))
firstWorkout.exercisesList.append(Exercise(name: "Front Squat", muscleGroup: "legs", sets: 4,repetitions: 8, isSelected: false))*/

/*
 adds exercises to the standard list
 
 standardExerciseList.append(Exercise(name: "Cable Triceps Pushdown", muscleGroup: "arms", sets: 8,repetitions: 8, isSelected: false))
standardExerciseList.append(Exercise(name: "Biceps curl", muscleGroup: "arms", sets: 8,repetitions: 8, isSelected: false))
standardExerciseList.append(Exercise(name: "Cable Chest Flys", muscleGroup: "chest", sets: 4,repetitions: 10, isSelected: false))
standardExerciseList.append(Exercise(name: "Incline Bench Press", muscleGroup: "chest", sets: 4,repetitions: 10, isSelected: false))
standardExerciseList.append(Exercise(name: "Back extension", muscleGroup: "back", sets: 4,repetitions: 6, isSelected: false))
standardExerciseList.append(Exercise(name: "Lat Pull-Down", muscleGroup: "back", sets: 4,repetitions: 6, isSelected: false))
standardExerciseList.append(Exercise(name: "Back Squat", muscleGroup: "legs", sets: 4,repetitions: 8, isSelected: false))
standardExerciseList.append(Exercise(name: "Front Squat", muscleGroup: "legs", sets: 4,repetitions: 8, isSelected: false))*/

/*let currentUser = self.auth.currentUser?.uid
 if let currentUser = currentUser{
 print(currentUser)
 }*/

//for filtered list
/*func deleteFromDb(indexSet: IndexSet, list: [Exercise]){
    for index in indexSet{
        let item = list[index]
        if let id = item.id,
            let user = auth.currentUser{
            db.collection("users").document(user.uid).collection("exercises").document(id).delete()
        }
    }
}*/

//MARK: USER


//un usuario guarda sus propios ejercicios, pero en la app o en db?
//en ejercicios mostrarias la lista de ejercicios del usuario
//@Published var exerciseList = [Exercise]()

/*
init(){
    exerciseList.append(Exercise(name: "Cable Triceps Pushdown", muscleGroup: "arms", sets: 8,repetitions: 8))
    exerciseList.append(Exercise(name: "Biceps curl", muscleGroup: "arms", sets: 8,repetitions: 8))
    exerciseList.append(Exercise(name: "Cable Chest Flys", muscleGroup: "chest", sets: 4,repetitions: 10))
    exerciseList.append(Exercise(name: "Incline Bench Press", muscleGroup: "chest", sets: 4,repetitions: 10))
    exerciseList.append(Exercise(name: "Back extension", muscleGroup: "back", sets: 4,repetitions: 6))
    exerciseList.append(Exercise(name: "Lat Pull-Down", muscleGroup: "back", sets: 4,repetitions: 6))
    exerciseList.append(Exercise(name: "Back Squat", muscleGroup: "legs", sets: 4,repetitions: 8))
    exerciseList.append(Exercise(name: "Front Squat", muscleGroup: "legs", sets: 4,repetitions: 8))
}*/

//MARK: EXERCISESVIEW

//shows user list for mail user
/*func showUserList(from model: AppViewModel, group: String)->[Exercise]{
 var list = [Exercise]()
 
 for exercise in model.user.exerciseList{
 if exercise.muscleGroup == group{
 list.append(exercise)
 }
 }
 return list
 }*/

//MARK: ADDworkoutView

/*@State var selectedItems = Set<UUID>()
@State var isChecked : Bool{
    selectedItems.contains(viewModel.standardExerciseList.exercise.id)
}
@State var selectedRows = Set<UUID>()*/


/*en la funcion que haga un workour object anade esta funcion
var date : String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    return dateFormatter.string(from: workout.date)
}*/
//------------ func addWorkout()
/*guard !name.isEmpty else {return print("Indicate a name for the workout")}

//let workout = Workout(name: name, exercisesList: itemsSelected)
let workout = Workout(name: name)
workout.exercisesList = itemsSelected*
viewModel.user.workoutList.append(workout)*/

//clickable list
/*List(){
    ForEach(viewModel.standardExerciseList) { exercise in
    //ForEach(newWorkout.exercisesList) { exercise in
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
}*/

//MARK: WORKOUT CLASS


// func addMockDatathis list is supposed to be empty when creating a workout


/*exercisesList.append(Exercise(name: "Cable Triceps Pushdown", muscleGroup: "arms", sets: 8,repetitions: 8, isSelected: false))
exercisesList.append(Exercise(name: "Biceps curl", muscleGroup: "arms", sets: 8,repetitions: 8, isSelected: false))
exercisesList.append(Exercise(name: "Cable Chest Flys", muscleGroup: "chest", sets: 4,repetitions: 10, isSelected: false))
exercisesList.append(Exercise(name: "Incline Bench Press", muscleGroup: "chest", sets: 4,repetitions: 10, isSelected: false))
exercisesList.append(Exercise(name: "Back extension", muscleGroup: "back", sets: 4,repetitions: 6, isSelected: false))
exercisesList.append(Exercise(name: "Lat Pull-Down", muscleGroup: "back", sets: 4,repetitions: 6, isSelected: false))
exercisesList.append(Exercise(name: "Back Squat", muscleGroup: "legs", sets: 4,repetitions: 8, isSelected: false))
exercisesList.append(Exercise(name: "Front Squat", muscleGroup: "legs", sets: 4,repetitions: 8, isSelected: false))*/
/*
exercisesList.append(Exercise(name: "Cable Triceps Pushdown", muscleGroup: "Arms", sets: 8,repetitions: 8))
exercisesList.append(Exercise(name: "Biceps curl", muscleGroup: "Arms", sets: 8,repetitions: 8))
exercisesList.append(Exercise(name: "Cable Chest Flys", muscleGroup: "Chest", sets: 4,repetitions: 10))
exercisesList.append(Exercise(name: "Incline Bench Press", muscleGroup: "Chest", sets: 4,repetitions: 10))
exercisesList.append(Exercise(name: "Back extension", muscleGroup: "Back", sets: 4,repetitions: 6))
exercisesList.append(Exercise(name: "Lat Pull-Down", muscleGroup: "Back", sets: 4,repetitions: 6))
exercisesList.append(Exercise(name: "Back Squat", muscleGroup: "Legs", sets: 4,repetitions: 8))
exercisesList.append(Exercise(name: "Front Squat", muscleGroup: "Legs", sets: 4,repetitions: 8))*/

//var a = Workout(name: "test", sets: 3, repetitions: 10)

/*
 rules_version = '2';
 service cloud.firestore {
 match /databases/{database}/documents {
 match /{document=**} {
 allow read, write: if
 request.time < timestamp.date(2023, 2, 24);
 }
 }
 }
 */


/*func deleteUserExercise(indexSet: IndexSet){
 user.exerciseList.remove(atOffsets: indexSet)
 }*/
//onDelete homeView list for usersWorkouts. list in users class
/*func deleteUserWorkout(at indexSet: IndexSet){
    user.workoutList.remove(atOffsets: indexSet)
}*/


//MARK: save to firestore
/*func dummyDbData(){
 //default exercises
 let a = Exercise(name: "Cable Triceps Pushdown", muscleGroup: "arms", sets: 8,repetitions: 8)
 let b = Exercise(name: "Biceps curl", muscleGroup: "arms", sets: 8,repetitions: 8)
 let c = Exercise(name: "Cable Chest Flys", muscleGroup: "chest", sets: 4,repetitions: 10)
 let d = Exercise(name: "Incline Bench Press", muscleGroup: "chest", sets: 4,repetitions: 10)
 let e = Exercise(name: "Back extension", muscleGroup: "back", sets: 4,repetitions: 6)
 let f = Exercise(name: "Lat Pull-Down", muscleGroup: "back", sets: 4,repetitions: 6)
 let g = Exercise(name: "Back Squat", muscleGroup: "legs", sets: 4,repetitions: 8)
 let h = Exercise(name: "Front Squat", muscleGroup: "legs", sets: 4,repetitions: 8)
 saveExerciseToFirestore(exercise: a)
 saveExerciseToFirestore(exercise: b)
 saveExerciseToFirestore(exercise: c)
 saveExerciseToFirestore(exercise: d)
 saveExerciseToFirestore(exercise: e)
 saveExerciseToFirestore(exercise: f)
 saveExerciseToFirestore(exercise: g)
 saveExerciseToFirestore(exercise: h)
 //default workout
 var firstWorkout = Workout(name: "User's First Workout")
 firstWorkout.exercisesList.append(Exercise(name: "Cable Triceps Pushdown", muscleGroup: "arms", sets: 8,repetitions: 8))
 firstWorkout.exercisesList.append(Exercise(name: "Biceps curl", muscleGroup: "arms", sets: 8,repetitions: 8))
 firstWorkout.exercisesList.append(Exercise(name: "Cable Chest Flys", muscleGroup: "chest", sets: 4,repetitions: 10))
 firstWorkout.exercisesList.append(Exercise(name: "Incline Bench Press", muscleGroup: "chest", sets: 4,repetitions: 10))
 firstWorkout.exercisesList.append(Exercise(name: "Back extension", muscleGroup: "back", sets: 4,repetitions: 6))
 firstWorkout.exercisesList.append(Exercise(name: "Lat Pull-Down", muscleGroup: "back", sets: 4,repetitions: 6))
 firstWorkout.exercisesList.append(Exercise(name: "Back Squat", muscleGroup: "legs", sets: 4,repetitions: 8))
 firstWorkout.exercisesList.append(Exercise(name: "Front Squat", muscleGroup: "legs", sets: 4,repetitions: 8))
 //standardWorkoutsList.append(firstWorkout)
 saveWorkoutToFirestore(workout: firstWorkout)
 }
 */
