import FirebaseAuth
import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

import SwiftUI

struct Exercise: Identifiable, Equatable, Codable{
    @DocumentID var id : String?
    var name : String
    var muscleGroup : String
    var sets : Int
    var repetitions : Int
    var description : String?
    
    
    
}
