//
//  TableViewController.swift
//  Algolia
//
//  Created by Grant Kemp on 14/10/2015.
//  Copyright © 2015 Grant Kemp. All rights reserved.
//

import UIKit
import AlgoliaSearch
import SwiftyJSON

class SearchTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {

    var searchController: UISearchController?
    
    //Algolia Client
    var movieIndex: Index!
    let myQuery = Query()
    
    //Store Algolia Results here
    var movies = [MovieRecord]()
    
    //Algolia Search Results Variables
    var searchId = 0
    var displayedSearchId = -1
    var loadedPage: UInt = 0
    var nbPages: UInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    createSearchController()
        
        setupAlgoliaClient()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let movie = movies[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath)
        cell.textLabel?.highlightedTextColor = UIColor.purpleColor()
        cell.textLabel?.highlightedText = movie.title
        cell.detailTextLabel?.text = "\(movie.year)"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        
        myQuery.query = searchController.searchBar.text
        let currentSearchId = searchId
        
        
        movieIndex.search(myQuery) { (content, error) -> Void in
            
            if currentSearchId <= self.displayedSearchId || error != nil {
                return //latest query is already displayd or there is an error
                
            }
            
            self.displayedSearchId = currentSearchId
            self.loadedPage = 0 // Reset loaded page
            
            //Decode JSON
            let json = JSON(content!)
            let hits: [JSON] = json["hits"].arrayValue
            self.nbPages = UInt(json["nbPages"].intValue)
            
            var tmp = [MovieRecord]()
            for record in hits {
                tmp.append(MovieRecord(json: record))
            }
            
            //Reload view
            self.movies  = tmp
            self.tableView.reloadData()

            
        }
        ++self.searchId
    }
    
    
    func createSearchController() {
        //Search Controller
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchResultsUpdater = self
        searchController?.dimsBackgroundDuringPresentation = false
        searchController?.searchBar.delegate = self
        
        // Add the search bar
        tableView.tableHeaderView = self.searchController!.searchBar
        definesPresentationContext = true
        searchController!.searchBar.sizeToFit()
        
        
    }
    
    func setupAlgoliaClient() {
        let apiClient = Client(appID: Constants.ALGOLIA_APPID, apiKey: Constants.ALGOLIA_APIKEY)
        movieIndex = apiClient.getIndex(Constants.ALGOLIA_INDEX)
        
        myQuery.hitsPerPage = 15
        myQuery.attributesToRetrieve = ["title", "image", "rating", "year"]
        myQuery.attributesToHighlight = ["title"]
        
        
    }
}
