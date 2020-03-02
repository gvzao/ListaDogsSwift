//
//  FavoritoTableViewController.swift
//  ListaDogsSwift
//
//  Created by Jonathan on 02/03/20.
//  Copyright © 2020 hbsoftware.ios. All rights reserved.
//

import UIKit

class FavoritoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: Override func
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0 //favorito.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "FavoritoTableViewCell"
        
        //As? para que a celula não receba algo que nao tenha na tabelaBares.
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FavoritoTableViewCell
        
        //Pegando a posição na tabela, para cetar as informações na celula de cada bar.
        //let dog = favorito[indexPath.row]
        
       // cell?.NomeDog.text = raca.nome
       // cell?.FtDog.image = raca.foto
        
        return cell!
    }
    
    
    
    
}

