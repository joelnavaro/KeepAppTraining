
import SwiftUI

class User: ObservableObject{
    
    @Published var firstName: String?
    var lastName: String?
    @Published var profilePicture: UIImage?
    var age: Int?
    @Published var workoutCompleted = 0
    @Published var exercisesCreated = 0
    
}
