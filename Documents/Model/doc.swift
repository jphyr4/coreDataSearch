//
//  doc.swift
//  Documents
//
//  Created by Jacob Paul Hassler on 9/21/18.
//  Copyright © 2018 jphyr4. All rights reserved.
//


import Foundation

struct docStruct {
    let url: URL
    let name: String
    let size: UInt64
    let modificationDate: Date

    var content: String? {
        get {
            return try? String(contentsOf: url, encoding: .utf8)
        }
    }
}
