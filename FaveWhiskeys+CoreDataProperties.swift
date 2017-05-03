//
//  FaveWhiskeys+CoreDataProperties.swift
//  
//
//  Created by Kelly Dickerson on 5/3/17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension FaveWhiskeys {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FaveWhiskeys> {
        return NSFetchRequest<FaveWhiskeys>(entityName: "FaveWhiskeys");
    }

    @NSManaged public var favorite: Bool
    @NSManaged public var name: String?

}
