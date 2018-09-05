//
//  DevTopicsTVC.swift
//  refactorDojo
//
//  Created by Brad Phillips on 9/4/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class DevTopicsTVC: UITableViewController {

    /**
     * To-Do:
        * Set up this table view controller to load in a list of topics
            * Reference DestinyListTVC if you get confused
            * Remember to add in similar function overrides to display cells
            * Remember to set appropriate number of sections and cells
    **/
    
    var devTopics = ["No Topics Available"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return devTopics.count
    }
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let devTopicsCell = UITableViewCell()
		devTopicsCell.textLabel?.text = devTopics[indexPath.row]
		return devTopicsCell
		
	}
	
}
