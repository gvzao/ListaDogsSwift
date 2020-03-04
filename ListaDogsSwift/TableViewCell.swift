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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let bundle = Bundle(for: type(of: self))
        
        let iconeFavorito = UIImage(named: "iconeFavorito", in: bundle, compatibleWith: self.traitCollection)
        
        let btnStar = UIButton(type: .system)
        btnStar.setImage(iconeFavorito, for: .normal)
        btnStar.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
          print("cliquei");
        btnStar.addTarget(self, action: #selector(getter: self.btnFavorito), for: .touchUpInside)
        
        accessoryView = btnStar
        
      
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
