//
//  Breeds.swift
//  ListaDogsSwift
//
//  Created by Jonathan on 03/03/20.
//  Copyright © 2020 hbsoftware.ios. All rights reserved.
//

import Foundation
import UIKit

class Breed {
    
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
    
}
