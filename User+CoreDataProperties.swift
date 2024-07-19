import Foundation
import CoreData

extension User: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var age: Int32
    @NSManaged public var bedTime: String?
    @NSManaged public var email: String?
    @NSManaged public var gender: String?
    @NSManaged public var height: Float
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var profileImage: Data?
    @NSManaged public var wakeUpTime: String?
    @NSManaged public var weight: Float
    @NSManaged public var drinkRecords: NSSet?
    @NSManaged public var settings: Settings?

}
