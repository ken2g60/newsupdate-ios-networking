//
//  HealthTipDetailTableViewController.swift
//  HealthT
//
//  Created by knight on 10/13/20.
//

import UIKit

class UpdateDetailTableViewController: UITableViewController {

    var newsTitle: String?
    var newsCategory: String?
    var newsLabel: String?
    var newsContent: String?
    var newsCountry: String?
    var newsPublisher: String?
    var newsSource: String?
    var newsImage: String?
    
    var update = [NewsUpdate]()
    
    @IBOutlet weak var headerView: UpdateHeaderTableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView?.isHidden = false
        // tableView.separatorStyle = .none
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "house")
        headerView.headerImage.image = UIImage(named: "default")
        tableView.tableFooterView?.isHidden = true

        
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UpdateTitleTableViewCell.self), for: indexPath) as! UpdateTitleTableViewCell
            cell.title.text = newsTitle
            cell.country.text = newsCountry
            cell.category.text = newsCategory
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UpdateContentTableViewCell.self), for: indexPath) as! UpdateContentTableViewCell
            
            cell.content.text = newsContent
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UpdateSourceTableViewCell.self), for: indexPath) as! UpdateSourceTableViewCell
            cell.source.text = newsSource
            cell.publisher.text = newsPublisher
            return cell
        default:
            fatalError("Failed to instatiate the table view cell for detail view controller")
        }
    }

}
