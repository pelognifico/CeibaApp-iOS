//
//  Posts+CoreDataProperties.swift
//  
//
//  Created by UnLimited on 4/12/21.
//
//

import Foundation
import CoreData


extension Posts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Posts> {
        return NSFetchRequest<Posts>(entityName: "Posts")
    }

    @NSManaged public var id: Int64
    @NSManaged public var idUser: Int64
    @NSManaged public var title: String?
    @NSManaged public var body: String?

}
