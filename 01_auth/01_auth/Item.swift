//
//  Item.swift
//  01_auth
//
//  Created by Vladlen on 15.10.2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
