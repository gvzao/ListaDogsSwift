//
//  FavoritoTableViewCell.swift
//  ListaDogsSwift
//
//  Created by Jonathan on 02/03/20.
//  Copyright © 2020 hbsoftware.ios. All rights reserved.
//

import UIKit

class FavoritoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ftDog: UIImageView!
    
    @IBOutlet weak var nome: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
