//
//  Storage+Extension.swift
//  Movies Inc
//
//  Created by Ahmed on 8/14/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
import Cache

extension Storage {
    class func shared() -> Storage? {
        guard let directory = try? FileManager.default.url(for: .documentDirectory,
                                                           in: .userDomainMask,
                                                           appropriateFor: nil,
                                                           create: true).appendingPathComponent("MyPreferences") else {
            return nil
        }
        let diskConfig = DiskConfig(
            name: "Floppy",
            expiry: .never,
            maxSize: 10000,
            directory: directory,
            protectionType: .complete
        )
        
        let memoryConfig = MemoryConfig(
            expiry: .date(Date().addingTimeInterval(2*60)),
            countLimit: 50,
            totalCostLimit: 0
        )
        return try? Storage(diskConfig: diskConfig, memoryConfig: memoryConfig)
    }
}
