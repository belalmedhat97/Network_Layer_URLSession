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
        AF.request(APIRouter.DogImage)
            .responseDecodable { (response: AFDataResponse<DogData>) in
                
                print(response)
                switch response.result {
                case .success(let response): 
                    print(response.status ?? "")
                    //You can handle 'response' when request success (response as LoginResponse)
                    self.DogImage.sd_setImage(with: URL(string: response.message ?? ""), completed: nil)
                case .failure(let error):
                    print(error)
                    break
                }
        }
    }
    

}

