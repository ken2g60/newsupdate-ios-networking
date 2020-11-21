//
//  HealthTipsTableViewController.swift
//  HealthT
//
//  Created by knight on 10/12/20.
//

import UIKit

class UpdateTableViewController: UITableViewController, UISearchResultsUpdating {
 
    

    private let apiEndpoint = "https://fathomless-plateau-94682.herokuapp.com/api/v1/news/updates/"
    private var newsUpdate = [NewsUpdate]()
    private var searchNewsUpdate = [NewsUpdate]()
    var searchController: UISearchController!
    
    var statusBarStyle: UIStatusBarStyle = .darkContent
    override func viewDidLoad() {
        super.viewDidLoad()

        // search
        searchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.placeholder = "Search News"
        searchController.searchBar.barTintColor = .white
        searchController.searchBar.backgroundImage = UIImage()
        
        
        // update search result
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        self.navigationItem.title = "News Updates"
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        getData()
    }
    
 
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.statusBarStyle
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsUpdate.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsupdate", for: indexPath) as! UpdateTableViewCell
        cell.title.text = newsUpdate[indexPath.row].title
        if let imageLoader = URL(string: newsUpdate[indexPath.row].image) {
           
            
            
            let imagecLoader = UIImage(url: imageLoader)
            if imagecLoader == nil {
                cell.imageView?.image = UIImage(named: "default")
            }else {
                cell.imageView?.image = UIImage(url: imageLoader)
            }
                
        
        }
        
        cell.category.text = newsUpdate[indexPath.row].category
        return cell
    }
    
    func getData(){
        
        guard let loadURL = URL(string: apiEndpoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: loadURL) { (data, response, error) in
            
            if let error = error {
                let alert = UIAlertController(title: "Error", message: "Check your Internet Connection \n \(error.localizedDescription)", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }
            if let data = data {
                print(data)
                self.newsUpdate = self.parseJSONData(data: data)
                OperationQueue.main.addOperation ({
                    self.tableView.reloadData()
                })
            }
        }
        task.resume()
    }
    
    func parseJSONData(data: Data) -> [NewsUpdate] {
        
        var newsUpdateModel = [NewsUpdate]()
        
        let decoder = JSONDecoder()
        
        do {
            
            let newsUpdateDataStore = try decoder.decode([NewsUpdate].self, from: data)
            newsUpdateModel = newsUpdateDataStore
            
        } catch {
            let alert = UIAlertController(title: "Error", message: "Check your Internet Connection \n \(error.localizedDescription)", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        return newsUpdateModel
    }
    
    func filterContent(for searchText: String){

        
        let filterArray = searchNewsUpdate.filter {
            $0.title == searchController.searchBar.text
          
        }
        print(filterArray)
        return tableView.reloadData()
    }
    
    
    
    func updateSearchResults(for searchController: UISearchController) {
  
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showUpdateDetails", sender: indexPath)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showUpdateDetails" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! UpdateDetailTableViewController
                destinationController.newsTitle = newsUpdate[indexPath.row].title
                destinationController.newsLabel = newsUpdate[indexPath.row].label
                destinationController.newsImage = newsUpdate[indexPath.row].image
                destinationController.newsContent = newsUpdate[indexPath.row].content
                destinationController.newsCountry = newsUpdate[indexPath.row].country
                destinationController.newsCategory = newsUpdate[indexPath.row].category
                destinationController.newsPublisher = newsUpdate[indexPath.row].publisher
                destinationController.newsSource = newsUpdate[indexPath.row].source
                
            }
        }
    }

}
