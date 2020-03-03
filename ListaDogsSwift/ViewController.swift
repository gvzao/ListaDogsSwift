//
//  ViewController.swift
//  ListaDogsSwift
//
//  Created by Jonathan on 28/02/20.
//  Copyright © 2020 hbsoftware.ios. All rights reserved.
//

import UIKit
import Alamofire



class ViewController: UITableViewController, UIImagePickerControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    static let apiUrl = "https://dog.ceo/api/breeds/list/all"
    
   
    @IBAction func btnFavorito(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        
    }
    @IBOutlet weak var tableViewRaca: UITableView!
    @IBOutlet weak var Image: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        atualizaBtn();
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1 //favorito.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "TableViewCell"
        
        //As? para que a celula não receba algo que nao tenha na tabelaFavoritos.
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FavoritoTableViewCell
        
        //Pegando a posição na tabela, para cetar as informações na celula de cada bar.
        //let dog = favorito[indexPath.row]
        
        //cell?.NomeDog.text = raca.nome
        //cell?.FtDog.image = raca.foto
        
        return cell!
    }
  
    
    func fetchData(){
        Alamofire.request("https://dog.ceo/api/breeds/list/all")
            .responseJSON { (response) in
                if response.result.isSuccess {
                    guard let data = response.result.value as? [String: Any] else {
                        print("Deu merda no primeiro guard")
                        return
                    }
                    guard let json = data["message"] as? [String: Any] else {
                        print("Deu merda no segundo guard")
                        return }
                    
                    self.arrayToDogList(array: json)
                    
                }
                else{
                    print("there was an error")
                }
        }
    }
    
    func arrayToDogList(array: [String: Any]) {
        for (key, subracas) in array {
            print(key)
            
            guard let subracasArray = subracas as? [String] else {
                continue
            }
            
            for subraca in subracasArray {
                print("  *  \(subraca)")
            }
        }
    }
    private func atualizaBtn() {
        
        let bundle = Bundle(for: type(of: self))
        
        let iconeAdd = UIImage(named: "iconeAdd", in: bundle, compatibleWith: self.traitCollection)
        
        let iconeFavorito = UIImage(named: "iconeFavorito", in: bundle, compatibleWith: self.traitCollection)
        
        let btnFav = UIButton()
        
        //Criando o botão a partir do que o usuario clicar
        btnFav.setImage(iconeAdd, for: .normal)
        btnFav.setImage(iconeFavorito, for: .selected)
        
        btnFav.addTarget(self, action: #selector(self.btnFavorito(_:)), for: .touchUpInside)
        

        
    }
    
    
}

