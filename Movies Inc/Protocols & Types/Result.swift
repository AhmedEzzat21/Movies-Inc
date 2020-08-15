//
//  Result.swift
//  Movies Inc
//
//  Created by Ahmed on 8/14/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(ErrorModel)
}
