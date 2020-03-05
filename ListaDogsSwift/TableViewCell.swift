//
//  TableViewCell.swift
//  ListaDogsSwift
//
//  Created by Jonathan on 02/03/20.
//  Copyright © 2020 hbsoftware.ios. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var nomeDog: UILabel!
    
    @IBOutlet weak var btnFavorito: UIButton!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

      
        
        
        

    

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
