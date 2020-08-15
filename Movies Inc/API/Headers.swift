//
//  Headers.swift
//  Movies Inc
//
//  Created by Ahmed on 8/14/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
import UIKit

class Headers: NSObject {
    private(set) var values: Params = [:]
    
    func update(_ value: String, forKey key: String) {
        values.updateValue(value, forKey: key)
    }
}
