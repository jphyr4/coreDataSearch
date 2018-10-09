//
//  CDProperty.swift
//  Documents
//
//  Created by Jacob Paul Hassler on 9/21/18.
//  Copyright © 2018 jphyr4. All rights reserved.
//

import Foundation
import CoreData


extension Docs {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Docs> {
        return NSFetchRequest<Docs>(entityName: "Doc")
    }

    @NSManaged public var name: String?
    @NSManaged public var content: String?
    @NSManaged public var size: Int64
    @NSManaged public var rawDate: NSDate?

}
