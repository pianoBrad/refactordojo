//
//  TopicTVC.swift
//  refactorDojo
//
//  Created by Brad Phillips on 9/9/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class TopicCell: UITableViewCell {
    
    var backColor : UIColor = .clear
    
    /**
     this is a default initializer, which will be called
     any time an instance of this class is created.
    **/
    required init?(coder aDecoder: NSCoder) {
            
        super.init(coder: aDecoder)
        
        self.backgroundColor = backColor
        
        /**
         To-Do:
            * Try setting the background color of this cell Class to be transparent
            * Also, change the text color of the label to white
         
            * You should see changes on the DestinyListTVC screen, as we're pulling
                in cells of this type of class for that table.
         
            * Bonus points: compare what's happening with the DestinyListTVC view in the storyboard & Class swift file & update the storyboard & file for DevTopicsTVC Class to utilize TopicTVC cells instead of the default
                UITableViewCells it's currently using.
         **/
    }
}
