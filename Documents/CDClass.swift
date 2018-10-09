//
//  CDClass.swift
//  Documents
//
//  Created by Jacob Paul Hassler on 9/21/18.
//  Copyright © 2018 jphyr4. All rights reserved.
//

import UIKit
import CoreData

@objc(Doc)
public class Docs: NSManagedObject {
    
    var date: Date? {
        get{
            return rawDate as Date?
        }
        set {
            rawDate = newValue as NSDate?
        }
    }
    
    convenience init?(name: String?, content: String?, size: Int64, date: Date?) {
        let d = UIApplication.shared.delegate as? AppDelegate
        
        guard let view = d?.containers.viewContext else{
            return nil
        }
        
        self.init(entity: Docs.entity(), insertInto: view)
        
        self.name = name
        self.content = content
        self.size = size
        self.date = date
        
    }
}
