//
//  FavoritoTableViewController.swift
//  ListaDogsSwift
//
//  Created by Jonathan on 02/03/20.
//  Copyright © 2020 hbsoftware.ios. All rights reserved.
//

import UIKit

class FavoritoTableViewController: UITableViewController {
    
    var favoritos = [Breed]();
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: Override func
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0 //favorito.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "favID"
        
        //As? para que a celula não receba algo que nao tenha na tabelaBares.
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FavoritoTableViewCell
        
        
        let dog = favoritos[indexPath.row]
        
        cell?.nome.text = dog.name
        
        if (dog.image == nil){
            cell?.ftDog.image = dog.image
       
        }else{
            print("Não tem imagem aqui")
        }
        
        return cell!
    }
    
    
    
    
}

