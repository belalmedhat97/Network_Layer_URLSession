//
//  ViewController.swift
//  Network layer
//
//  Created by Belal medhat on 6/10/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var DogImage: UIImageView!
    
    @IBAction func ApiCallButton(_ sender: UIButton) {
        Network.Request(URL: DogAPIRouter.DogImage.urlRequest) { (result:CustomResults<DogResponse,DogErrorResponse,Error>) in
                switch result{
                     case .success(let response):
                        print(response)
                         print(response.status ?? "")
                        if let imageURL = URL(string: response.message ?? "") {
                        guard let imageData = try? Data(contentsOf: imageURL) else {return}
                            DispatchQueue.main.async {
                                    self.DogImage.image = UIImage(data: imageData)

                            }
                    }
                        //You can handle 'response' when request success (response as LoginResponse)
        //                self.DogImage.sd_setImage(with: URL(string: response.message ?? ""), completed: nil)
                     case .failure(let error):
                        print("")
                        print(error.code ?? "100")
                        print(error)
                case .failureError(let error):
                    print(error.localizedDescription)
            }
                }
    }
    @IBAction func errorReponse(_ sender: UIButton) {
            Network.Request(URL: DogAPIRouter.DogError.urlRequest) { (result:CustomResults<DogResponse,DogErrorResponse,Error>) in
                    switch result{
                         case .success(let response):
                            print(response)
                             print(response.status ?? "")
                            //You can handle 'response' when request success (response as LoginResponse)
            //                self.DogImage.sd_setImage(with: URL(string: response.message ?? ""), completed: nil)
                         case .failure(let error):
                            print("")
                            print(error.code ?? "100")
                            print(error)
                    case .failureError(let error):
                        print(error.localizedDescription)
                }
                    }
        }
    
    

}

