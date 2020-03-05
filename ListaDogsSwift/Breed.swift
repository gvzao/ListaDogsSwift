//
//  Breeds.swift
//  ListaDogsSwift
//
//  Created by Jonathan on 03/03/20.
//  Copyright © 2020 hbsoftware.ios. All rights reserved.
//

import os.log
import Foundation
import UIKit

class Breed: NSObject, NSCoding {
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in:
        .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("breeds")
    static let LastBreedURL = DocumentsDirectory.appendingPathComponent("lastBreed")
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(image, forKey: PropertyKey.image)
        aCoder.encode(imageurl, forKey: PropertyKey.imageurl)
        aCoder.encode(fromBreed, forKey: PropertyKey.fromBreed)
        aCoder.encode(subBreeds, forKey: PropertyKey.subBreeds)
        aCoder.encode(isFavorite, forKey: PropertyKey.isFavorite)
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Dog object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let image = aDecoder.decodeObject(forKey: PropertyKey.image)
        
        let imageurl = aDecoder.decodeObject(forKey: PropertyKey.imageurl)
        
        let fromBreed = aDecoder.decodeObject(forKey: PropertyKey.fromBreed)
        
        let subBreeds = aDecoder.decodeObject(forKey: PropertyKey.subBreeds)
        
        let isFavorite = aDecoder.decodeObject(forKey: PropertyKey.isFavorite)
        
        self.init(name: name)
    
    }
    
    var name: String
    var image: UIImage?
    var imageurl: String?
    var fromBreed: Breed?
    var subBreeds: [Breed]?
    var isFavorite: Bool = false


struct PropertyKey {
    static let name = "name"
    static let image = "image"
    static let imageurl = "imageurl"
    static let fromBreed = "fromBreed"
    static let subBreeds = "subBreeds"
    static let isFavorite = "isFavorite"
    }
    
    
    init?(name: String) {
        self.name = name
    }
    
    init?(name: String, image: UIImage?, imageUrl: String?, fromBreed: String?, subBreeds: [Breed]?, isFavorite: Bool) {
        
        self.name = name
        self.image = image
        self.imageurl = imageUrl
        self.fromBreed = fromBreed
        self.subBreeds = subBreeds
        self.isFavorite = isFavorite
        
    }
    
}
