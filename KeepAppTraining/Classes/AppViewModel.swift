
import Foundation
import FirebaseAuth
import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

class AppViewModel: ObservableObject{
    let auth = Auth.auth()
    let db = Firestore.firestore()
    
    @Published var signedIn = false
    
    @Published var user = User()
    @Published var standardExerciseList = [Exercise]()
    @Published var standardWorkoutsList = [Workout]()
    
//MARK: USER EXISTS AND TELLS THE STATE SIGNEDIN
    var userCreated : Bool{
        return auth.currentUser != nil
        //auth.currentuser == nil > not signed in
        //!=nil > signed in
    }
    
    init(){
        //readExercisesFiresbase()
        //readWorkoutsFiresbase()
        //dummyDbData()
    }
    func dummyWorkout(){
        //creates a first workout for the user
        var firstWorkout = Workout(id: "abc", name: "User's First Workout")
        firstWorkout.exercisesList.append(Exercise(name: "Cable Triceps Pushdown", muscleGroup: "arms", sets: 8,repetitions: 8))
        firstWorkout.exercisesList.append(Exercise(name: "Biceps curl", muscleGroup: "arms", sets: 8,repetitions: 8))
        firstWorkout.exercisesList.append(Exercise(name: "Cable Chest Flys", muscleGroup: "chest", sets: 4,repetitions: 10))
        firstWorkout.exercisesList.append(Exercise(name: "Incline Bench Press", muscleGroup: "chest", sets: 4,repetitions: 10))
        firstWorkout.exercisesList.append(Exercise(name: "Back extension", muscleGroup: "back", sets: 4,repetitions: 6))
        firstWorkout.exercisesList.append(Exercise(name: "Lat Pull-Down", muscleGroup: "back", sets: 4,repetitions: 6))
        firstWorkout.exercisesList.append(Exercise(name: "Back Squat", muscleGroup: "legs", sets: 4,repetitions: 8))
        firstWorkout.exercisesList.append(Exercise(name: "Front Squat", muscleGroup: "legs", sets: 4,repetitions: 8))
        standardWorkoutsList.append(firstWorkout)    }
    func dummyExercises(){
        //creates exercises for the user user
        standardExerciseList.append(Exercise(id: "abc", name: "Cable Triceps Pushdown", muscleGroup: "arms", sets: 8,repetitions: 8))
        standardExerciseList.append(Exercise(id: "def", name: "Biceps curl", muscleGroup: "arms", sets: 8,repetitions: 8))
        standardExerciseList.append(Exercise(id: "ghi", name: "Cable Chest Flys", muscleGroup: "chest", sets: 4,repetitions: 10))
        standardExerciseList.append(Exercise(id: "jkl", name: "Incline Bench Press", muscleGroup: "chest", sets: 4,repetitions: 10))
        standardExerciseList.append(Exercise(id: "mno", name: "Back extension", muscleGroup: "back", sets: 4,repetitions: 6))
        standardExerciseList.append(Exercise(id: "pqr", name: "Lat Pull-Down", muscleGroup: "back", sets: 4,repetitions: 6))
        standardExerciseList.append(Exercise(id: "stw", name: "Back Squat", muscleGroup: "legs", sets: 4,repetitions: 8))
        standardExerciseList.append(Exercise(id: "xyz", name: "Front Squat", muscleGroup: "legs", sets: 4,repetitions: 8))
    }
    
//MARK: Login funcstions
    func signInAnonymously(){
        if auth.currentUser == nil{
            auth.signInAnonymously { authResult, error in
                if let error = error{
                    print("Failed to sign in: ", error)
                    return
                }else{
                    print("Succesfully signed in: \(authResult?.user.uid ?? "")")
                    DispatchQueue.main.async {
                        self.signedIn = true
                    }
                }
            }
        }
    }
    func singIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password, completion: {
            [weak self] result, error in
            //guard result != nil, error == nil else {return}
            if let error = error{
                print("Failed to sign in: ", error)
                return
            }
            print("Succesfully signed in: \(result?.user.uid ?? "")")
            //success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        })
    }
    func singUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password, completion: {
            [weak self] result, error in
            //guard result != nil, error == nil else {return}
            if let error = error{
                print("Failed to sign un: ", error)
                return
            }
            print("Succesfully created user: \(result?.user.uid ?? "")")
            //success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        })
    }
    func signOut(){
        try? auth.signOut()  //should i catch error for this??
        self.signedIn = false
    }
    
    
//MARK: delete functions
    func deleteStandardWorkout(at indexSet: IndexSet){
        standardWorkoutsList.remove(atOffsets: indexSet)
    }
//MARK: save functions
    
//MARK: Firebase functions
    func readExercisesFiresbase(){
        guard let user = auth.currentUser else {return}
        
        db.collection("users").document(user.uid).collection("exercises").addSnapshotListener{snapshot, err in
            guard let snapshot = snapshot else {return} //check snapshot is not nil
            
            if let err = err{ //check for error
                print("Error getting document \(err)")
            }else{
                self.standardExerciseList.removeAll() //list where all exercises go
                self.dummyExercises() //add a default set of exercises
                
                for document in snapshot.documents{ //reading docs
                    let result = Result{
                        try document.data(as: Exercise.self)
                    }
                    switch result{
                    case .success(let item) :
                        self.standardExerciseList.append(item)
                    case .failure(let error) :
                        print("error decoding item: \(error)")
                    }
                }
                
            }
        }
    }
    func readWorkoutsFiresbase(){
        guard let user = auth.currentUser else {return}
        
        db.collection("users").document(user.uid).collection("workouts").addSnapshotListener{ snapshot, err in
            guard let snapshot = snapshot else {return} //check snapshot is not nil
            
            if let err = err{ //check for error
                print("Error getting document \(err)")
            }else{
                self.standardWorkoutsList.removeAll() //list where all workouts go
                self.dummyWorkout()
                for document in snapshot.documents{//reading docs
                    //convert every result into workout
                    let result = Result{
                        try document.data(as: Workout.self)
                    }
                    switch result{
                    case .success(let item) :
                        self.standardWorkoutsList.append(item)
                        for a in item.exercisesList{
                            print("content in list: \(String(describing: item.name)) : \(a.name)")
                        }
                    case .failure(let error) :
                        print("error decoding item: \(error)")
                    }
                }
                
            }
        }
    }
    func saveExerciseToFirestore(exercise: Exercise){
        guard let user = auth.currentUser else {return}
        do{
            _ = try db.collection("users").document(user.uid).collection("exercises").addDocument(from: exercise)
        } catch {
            print("error saving to DB")
        }
    }
    //ONLY FOR TEST
    func saveWorkoutToFirestore(workout: Workout){
        guard let user = auth.currentUser else {return}
        do{
            _ = try db.collection("users").document(user.uid).collection("workouts").addDocument(from: workout)
        } catch {
            print("error saving to DB")
        }
    }
    func deleteExerciseInDb(indexSet: IndexSet){
        //standardExerciseList.remove(atOffsets: indexSet)
        
        for index in indexSet{
            let item = standardExerciseList[index]
            if let id = item.id,
               let user = auth.currentUser{
                db.collection("users").document(user.uid).collection("exercises").document(id).delete()
            }
        }
        
    }
    func deleteWorkoutInDb(indexSet: IndexSet){
        //standardExerciseList.remove(atOffsets: indexSet)
        
        for index in indexSet{
            let item = standardWorkoutsList[index]
            if let id = item.id,
               let user = auth.currentUser{
                db.collection("users").document(user.uid).collection("workouts").document(id).delete()
            }
        }
        
    }
}
