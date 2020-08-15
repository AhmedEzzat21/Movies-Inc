//
//  TypeAlias.swift
//  Movies Inc
//
//  Created by Ahmed on 8/14/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
typealias Params = [String: String]
typealias Response<T: Decodable> = (Result<T>) -> ()
