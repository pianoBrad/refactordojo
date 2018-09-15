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

/**
 * extending LandingVC to be an AccountSignupVCDelegate responder
 * This would be same as if we did the following on line 11:
    * class LandingVC: UIViewController, AccountSignupVCDelegate
 * extensions are oftentimes cleaner & help separate code into
 * more readable and organized chunks (always a good programming practice)
 **/
extension LandingVC : AccountSignupVCDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /**
         * When we're ready to present the account sign up view,
         * let's make sure we're listening to it for any delegate events
         * it might call.
         **/
        
        if let destination = segue.destination as? AccountSignupVC {
            destination.accountSignupDelegate = self
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
