//
//  ViewController.swift
//  Network layer
//
//  Created by Belal medhat on 6/10/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var DogImage: UIImageView!
    
    @IBAction func ApiCallButton(_ sender: UIButton) {
        NetworkCaller.Request(APIRouter.DogImage) { (result:Result<DogData,Error>) in
            switch result{
             case .success(let response):
                 print(response)
                 print(response.status ?? "")
                //You can handle 'response' when request success (response as LoginResponse)
                self.DogImage.sd_setImage(with: URL(string: response.message ?? ""), completed: nil)
             case .failure(let error):
                print(error.localizedDescription)
                print(error)
             }
        }
    }
    @IBAction func errorReponse(_ sender: UIButton) {
        NetworkCaller.Request(APIRouter.DogError) { (result:Result<DogData,Error>) in
                  switch result{
                   case .success(let response):
                       print(response)
                       print(response.status ?? "")
                      //You can handle 'response' when request success (response as LoginResponse)
                      self.DogImage.sd_setImage(with: URL(string: response.message ?? ""), completed: nil)
                   case .failure(let error):
                    print(error.localizedDescription)
                    print(error)
                    let alert = UIAlertController(title: "", message: error.localizedDescription, preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                    print(error.localizedDescription)
                    print(error.asAFError)
                    print(error.localizedDescription.description)
                   }
              }
    }
    

}

