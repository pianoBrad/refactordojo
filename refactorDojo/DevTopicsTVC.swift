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
     * Done:
        * Keithon configured the cellForRowAt override to load in a custom
            UITableViewCell with labels describing a list of dev topics :)
    **/
    
    /** Properties **/
    
    var devTopics = ["No Topics Available"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    /** overrides: UITableViews **/
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devTopics.count
    }
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
		let devTopicsCell = UITableViewCell()
		devTopicsCell.textLabel?.text = devTopics[indexPath.row]
		return devTopicsCell
	}
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedTopic = self.devTopics[indexPath.row]
        
        if selectedTopic == "Protocols & Delegates (Answers)" {
            self.performSegue(withIdentifier: "whoYouGotSegue", sender: self)
        }
    }
	
}
