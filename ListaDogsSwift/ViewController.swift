//
//  ViewController.swift
//  ListaDogsSwift
//
//  Created by Jonathan on 28/02/20.
//  Copyright © 2020 hbsoftware.ios. All rights reserved.
//

import UIKit
import Alamofire



class ViewController: UIViewController, UIImagePickerControllerDelegate {
    static let apiUrl = "https://dog.ceo/api/breeds/list/all"
    
   
    @IBOutlet weak var tableViewRaca: UITableView!
    @IBOutlet weak var Image: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
}

