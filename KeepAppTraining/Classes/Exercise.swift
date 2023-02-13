import FirebaseAuth
import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

import SwiftUI

struct Exercise: Identifiable, Equatable, Codable{
    @DocumentID var id : String?
    //var id = UUID()
    var name : String
    var muscleGroup : String
    
    //int for sets
    var sets : Int
    //int for repetitions
    var repetitions : Int
    // int for wheight, puede ser nil, asi vas por libre
    var isSelected = false
    
    // var weight : Double / can be optional
    //little description of the exercise
    var description : String?
    
    // var Image
    
    
}
