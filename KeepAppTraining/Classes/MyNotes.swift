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
