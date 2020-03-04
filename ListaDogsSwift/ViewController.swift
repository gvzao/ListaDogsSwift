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
    
    
    var breed: Breed?
    var breeds = [Breed]()
    
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
                    guard let result = response.result.value as? [String: Any] else {
                        return
                    }
                    guard let json = result["message"] as? [String: Any] else {
                        return }
                    
                    let data = self.parseDictionaryOfStringToArrayOfBreeds(dictionary: json)
                    
                    self.loadDataToList(data: data)
                }
                else{
                    print("There was an error")
                }
        }
    }
    
    func loadDataToList(data: [Breed]?) {
        if let listBreed = data {
            breeds += listBreed
            breedTableView.reloadData()
        } else {
            print("Couldn't load any data")
            breeds = []
        }
    }
    
    private func parseDictionaryOfStringToArrayOfBreeds(dictionary: [String: Any]) -> [Breed] {
        var data = [Breed]()
        
        for (breedName, arrayOfSubBreeds) in dictionary {
            let breed = Breed(name: breedName)!
            
            guard let subBreedsArray = arrayOfSubBreeds as? [String] else {
                data.append(breed)
                continue
            }
            
            var subBreeds = [Breed]()
            
            for subBreedName in subBreedsArray {
                let subBreed = Breed(name: subBreedName)!
                subBreed.fromBreed = breed
                
                subBreeds.append(subBreed)
            }
            
            breed.subBreeds = subBreeds
            data.append(breed)
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
        
        let breed = breeds[indexPath.row]
        
        cell.nomeDog.text = breed.name
        cell.btnFavorito.isSelected = breed.isFavorite
        
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
