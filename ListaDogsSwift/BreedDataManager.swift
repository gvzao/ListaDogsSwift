//
//  BreedDataManager.swift
//  ListaDogsSwift
//
//  Created by Jonathan on 05/03/20.
//  Copyright © 2020 hbsoftware.ios. All rights reserved.
//

import Foundation
import os.log

class BreedDataManager {
    
    static func saveDogs(breeds: [Breed]) {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(breeds, toFile: Breed.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Breeds successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save Breeds", log: OSLog.default, type: .error)
        }
    }
    
    static func loadBreeds() -> [Breed]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Breed.ArchiveURL.path) as? [Breed]
    }
    
    static func setLastBreed(breed: Breed) {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(breed, toFile: Breed.LastBreedURL.path)
        if isSuccessfulSave {
            os_log("Last breed successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save last breed", log: OSLog.default, type: .error)
        }
    }
    
    static func loadLastBreed() -> Breed? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Breed.LastBreedURL.path) as? Breed
    }
}
