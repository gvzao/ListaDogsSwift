//
//  ViewController.swift
//  ListaDogsSwift
//
//  Created by Jonathan on 28/02/20.
//  Copyright © 2020 hbsoftware.ios. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    
    static let apiUrl = "https://dog.ceo/api/breeds/list/all"
    
    @IBOutlet weak var breedImageView: UIImageView!
    @IBOutlet weak var breedTableView: UITableView!
    
    
    var breed: String?
    var breeds = [String]()
    
    //MARK: Initializer

    override func viewDidLoad() {
        super.viewDidLoad()
        
        breedTableView.dataSource = self
        breedTableView.delegate = self
        
        fetchData()
        requestImagem(url : "https://images.dog.ceo/breeds/lhasa/n02098413_6039.jpg")
    }
    
    //MARK: API request methods
  
    func fetchData() {
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
                    
                    self.loadDataToList(data: self.arrayToDogList(array: json))
                    
                }
                else{
                    print("there was an error")
                }
        }
    }
    
    func loadDataToList(data: [String]?) {
        if let listBreed = data {
            breeds += listBreed
            breedTableView.reloadData()
        } else {
            print("Couldn't load any data")
            breeds = []
        }
    }
    
    func arrayToDogList(array: [String: Any]) -> [String] {
        var data = [String]()
        
        for (key, subracas) in array {
            data.append(key);
            
            guard let subracasArray = subracas as? [String] else {
                continue
            }
            
            for subraca in subracasArray {
                
            }
        }
        
        return data
    }
    
    //MARK: TableView methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "dogCell"
      
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TableViewCell else {
            fatalError("The cell isn't a instance of TableViewCell")
        }
        
        let nomeDog = breeds[indexPath.row]
        
        cell.nomeDog.text = nomeDog
        
        return cell
    }
    
    func fetchImage(breed: Breed) {
        var url: String;
        
        if(breed.fromBreed == nil) {
            url = "https://dog.ceo/api/breed/\(breed.fromBreed!)/\(breed.name)/images/random"
        } else {
            url = "https://dog.ceo/api/breed/\(breed.name)/images/random"
        }
        
        Alamofire.request(url)
            .responseJSON { (response) in
                if response.result.isSuccess {
                    guard let data = response.result.value as? [String: Any] else {
                        return
                    }
                    guard let imageUrl = data["message"] as? String else {
                        return }
                    
                    self.requestImagem(url: imageUrl)
                }
                else{
                    print("there was an error")
                }
        }
    }
    
    func requestImagem(url : String){
        print("chamou o metodo")
        Alamofire.request(url).responseImage {response in
            if let image = response.result.value{
                print("chegou")
                self.breedImageView.image = image
                print("era para ter ido")
            } else {
                print("deu merda")
    
     }
    print("fim do metodo")
    }
    
}
}
