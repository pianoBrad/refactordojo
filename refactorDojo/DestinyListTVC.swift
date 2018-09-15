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

    /** overrides: UIViewController **/
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /**
     * Brad-Add: added to prepare for and send data to the next tableview controller
     *
     * This prepare method always fires before a segue is performed. So, before we
     * transition to the next view, we want to be sure we set the views devTopics to
     * be equal to the topics we want to display there (which we defined in the
     * didSelectRowAt function override starting around line 68
     **/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? DevTopicsTVC {
            
            destination.devTopics = self.devTopics
        }
    }
    
    /** overrides: UITableViews **/

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destinyList.count
    }

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		/**
         * Changed this to load reusable objects of the new custom TopicTVC Class
         * dequeueReusableCell (rather than initing a new table cell for each row),
         * helps save the app's performance, as it reuses an existing created object.
         * When tables have a million rows, this strategy becomes vital to help
         * prevent apps from crashing.
         **/
 
        if let destinyCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TopicCell {
            destinyCell.textLabel?.text = destinyList[indexPath.row]
            return destinyCell
        } else {
            print("Custom table cell Class not properly loading for table cell.")
            return UITableViewCell()
        }
	}

    /**
     * This override fires whenever a row in a table on this view controller is tapped.
     *
     * We can find out details about which row was tapped here and do different things
     *   based on what we learn of the tapped row.
     **/
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /**
         * Brad-add: Switched the chained if/else statements to a switch statement.
         * Switch statements are better performing
         
         * To-Do:
            * Review the switch statement code and see if you can understand what it's doing.
            * We'll talk about conditionals in more detail in-person :)
         **/
        
        switch (indexPath.row) {
        case 1:
            devTopics = ["Nothing for PHP; Coming Soon!"]
            break
        case 2:
            devTopics = ["Nothing for JavaScript; Coming Soon!"]
            break
        default:
            devTopics = ["Classes", "Comments", "Operators", "Variables", "Conditionals", "Protocols & Delegates (Test)", "Protocols & Delegates (Answers)", "Loops", "Calendars", "PickerViews", "More on Arrays", "Preparing Segue Statements", "Performing Segue Statements"]
        }
    
        /**
         * After we define which set of topics we want to see on the next screen,
         * we call the method which will pass us to that next screen.
         **/
        self.performSegue(withIdentifier: "showDevTopicsSegue", sender: self)
    }
}
