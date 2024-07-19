//
//  Settings+CoreDataProperties.swift
//  Health Tracking
//
//  Created by Kesselly Kamara on 7/4/24.
//
//



import Foundation
import CoreData

extension Settings: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Settings> {
        return NSFetchRequest<Settings>(entityName: "Settings")
    }

    @NSManaged public var allowNotification: Bool
    @NSManaged public var reminderFrequency: String?
    @NSManaged public var reminderSound: Bool
    @NSManaged public var reminderVolume: Float
    @NSManaged public var vibration: Bool
    @NSManaged public var user: User?

}
