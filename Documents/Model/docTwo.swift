//
//  docTwo.swift
//  Documents
//
//  Created by Jacob Paul Hassler on 9/21/18.
//  Copyright © 2018 jphyr4. All rights reserved.
//


import Foundation

class Documents {
    
    class func get() -> [docStruct] {
        var docs = [docStruct]()
        let docsLink = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        if let link = try? FileManager.default.contentsOfDirectory(at: docsLink, includingPropertiesForKeys: nil) {
            for url in link {
                let title = url.lastPathComponent
                if let attributes = try? FileManager.default.attributesOfItem(atPath: url.path),
                    let size = attributes[FileAttributeKey.size] as? UInt64,
                    let newDate = attributes[FileAttributeKey.modificationDate] as? Date {
                    docs.append(docStruct(url: url, name: title, size: size, modificationDate: newDate))
                }
            }
        }
        
        return docs
    }
    
    class func remove(url: URL) {
        try? FileManager.default.removeItem(at: url)
    }
    
    class func save(title: String, content: String) {
        let linkone = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let linktwo = linkone.appendingPathComponent(title)

        try? content.write(to: linktwo, atomically: true, encoding: .utf8)
    }
}
