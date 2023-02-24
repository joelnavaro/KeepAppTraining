
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Workout: Identifiable, Equatable, Codable{
    @DocumentID var id : String?
    var name : String?
    var date : Date = Date()
    var exercisesList = [Exercise]()
    
    //image for the workoutview
    //var image : Image or UIImage
    //emoji to show on the lists
    //var b = "💪🏾"
}
