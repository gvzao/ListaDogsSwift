//
//  ViewController.swift
//  ListaDogsSwift
//
//  Created by Jonathan on 28/02/20.
//  Copyright © 2020 hbsoftware.ios. All rights reserved.
//

import UIKit
import Alamofire

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
    
}
