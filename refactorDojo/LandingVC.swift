//
//  LandingVC.swift
//  refactorDojo
//
//  Created by Brad Phillips on 9/7/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class LandingVC: UIViewController  {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension LandingVC : AccountSignupVCDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /**
         * When we're ready to present the account sign up view,
         * let's make sure we're listening to it for any delegate events
         * it might call.
         **/
        if let destination = segue.destination as? AccountSignupVC {
            destination.delegate = self
        }
    }
    
    /**
     * When account sign up view controller notifies us account creation
     * was successful, we can pass the user over to the first topics list
     **/
    func accountCreated(forUser: String?) {
        self.performSegue(withIdentifier: "chooseDestinySegue", sender: self)
    }
}
