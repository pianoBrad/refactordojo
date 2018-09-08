//
//  DestinyListTVC.swift
//  refactorDojo
//
//  Created by Keithon Stribling on 9/4/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class DestinyListTVC: UITableViewController {
	
	/** Properties **/
	
	let destinyList = ["Swift", "PHP", "JavaScript"]
    var devTopics = ["No topics available"]

    /** VC overrides **/
    
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

    /**
     * Brad-Add: added to prepare for and send data to the next tableview controller
     **/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? DevTopicsTVC {
            
            destination.devTopics = self.devTopics
        }
		/*****************************************************************
		KSNotes:
		I want to understand these segue methods even better...
		******************************************************************/
    }
    
    /** TVC overrides **/

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destinyList.count
    }

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let destinyCell = UITableViewCell()
		
		destinyCell.textLabel?.text = destinyList[indexPath.row]
		
		return destinyCell
	}

    /**
     * Brad-Add: Added this override in to capture the event when a user taps a particular cell
     *
     * Properties:
     * tableView = the tableView that contained the row being tapped
     * indexPath = the row number the user tapped (starting with 0 as 1st row)
     **/
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // There's a better way to do this, but a series of if statements will work to help us determine which subject was selected
        if (indexPath.row == 0) {
            // Swift selected (1st item in destinyList array)
            
            // To-Do: set the dev topics array equal to a list of Swift topics you want to learn about most (can be whatever you want, haha)
			devTopics = ["Classes", "Comments", "Operators", "Variables", "Calendars", "PickerViews", "More on Arrays", "Preparing Segue Statements", "Performing Segue Statements"]
        }
			
			//************ this comment is to see if the git repo profile works...
			
        else if (indexPath.row == 1) {
            // PHP Selected
            devTopics = ["Nothing for PHP; Coming Soon!"]
        }
		
		else if (indexPath.row == 2) {
			// JavaScript Selected
			devTopics = ["Nothing for JavaScript; Coming Soon!"]
		}
        // To-Do: Finish the series of if statements for the remaining option(s)
    
        // After we set devTopics variable, we fire perform segue function
        // Note what we're to override this function above to pass info over
        self.performSegue(withIdentifier: "showDevTopicsSegue", sender: self)
        
		/****************************************************
		KSNotes:
		I'm not sure I can explain back to you what you did here.
		*****************************************************/
    }

}
