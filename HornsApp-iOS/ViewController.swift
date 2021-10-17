//
//  ViewController.swift
//  HornsApp-iOS
//
//  Created by Yesferal Cueva on 16/10/21.
//

import UIKit
import HornsAppCore
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let text = TextDrawer(en: "English!", es: "Español!").text ?? "Fake text"
        
        print("viewDidLoad:")
        print("Text: \(text)")
        
        _ = AF.request("https://demo8819092.mockable.io/concert", headers: ["Authorization": "Authorization"])
                    .responseDecodable(of: [GetConcerts].self) { response in
                        switch response.result {
                            case .success(let concerts):
                                print(concerts.map() { concert in concert.name ?? ""}.joined(separator: "; "))
                            case .failure(let error):
                                print(error)
                            }
                }
    }


}

