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
                    guard let data = response.result.value as? [String: Any] else { return }
                    guard let json = data ["data"] as? [String: Any] else { return }
                    print(json)
                }
                else{
                    print("there was an error")
                }
        }
    }

}

