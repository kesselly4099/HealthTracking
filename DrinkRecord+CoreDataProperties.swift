import Foundation
import CoreData

extension DrinkRecord: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DrinkRecord> {
        return NSFetchRequest<DrinkRecord>(entityName: "DrinkRecord")
    }

    @NSManaged public var amount: Int32
    @NSManaged public var id: UUID?
    @NSManaged public var time: Date?
    @NSManaged public var user: User?

}
