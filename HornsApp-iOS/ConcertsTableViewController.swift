//
//  ConcertsTableViewController.swift
//  HornsApp-iOS
//
//  Created by Yesferal Cueva on 17/10/21.
//

import UIKit
import HornsAppCore
import Alamofire
import Kingfisher

class ConcertsTableViewController: UITableViewController {
    
    var concerts: [GetConcerts] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = "https://demo8819092.mockable.io/"
        let authorization = "authorization"
        _ = AF.request("\(api)concert", headers: ["Authorization": authorization])
                            .responseDecodable(of: [GetConcerts].self) { response in
                                switch response.result {
                                    case .success(let concerts):
                                        print(concerts.map() { concert in concert.name ?? ""}.joined(separator: "; "))
                                        self.concerts = concerts
                                        self.tableView.reloadData()
                                    case .failure(let error):
                                        print(error)
                                    }
                        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return concerts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConcertCell", for: indexPath) as! ConcertTableViewCell
        
        let concert = concerts[indexPath.row]
        cell.concertTitleLabel?.text = concert.name
        let url = URL(string: concert.headlinerImage ?? "")
        cell.concertImageView?.kf.setImage(with: url)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let defaultHeader = "Upcoming"
        let header = TextDrawer(en: defaultHeader, es: "Proximos").text ?? defaultHeader
        return header
    }

}

class ConcertTableViewCell: UITableViewCell {
    @IBOutlet weak var concertTitleLabel: UILabel!
    @IBOutlet weak var concertImageView: UIImageView!
}
