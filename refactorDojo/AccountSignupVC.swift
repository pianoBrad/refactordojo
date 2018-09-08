//
//  AccountSignupVC.swift
//  refactorDojo
//
//  Created by Keithon Stribling on 9/4/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol AccountSignupVCDelegate : class {
    
    func accountCreated(forUser: String?)
}

class AccountSignupVC: UIViewController {
	
	/** Properties **/
	
	@IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var feedbackLabel: UILabel!
    
    var accountCreated : Bool = false
    weak var delegate : AccountSignupVCDelegate?
    
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
        backButton.imageView?.contentMode = .scaleAspectFit
    }
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /**
         * Any time a user taps on the screen, we dismiss the keyboard,
         * if it's engaged, to make the screen more intuitive
         **/
        self.view.endEditing(true)
    }
    
	/** Actions **/
	
	@IBAction func backButtonPress(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
	}
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        
        // Dismiss keyboard, if active
        self.view.endEditing(true)
        
        // Try to create account
        if (tryCreateAccount()) {
            // Account creation success!
            
            // Dismiss this view controller
            self.dismiss(animated: true, completion: {
                /**
                 * Once dismiss animation complete (controller is off the display,and
                 * initial landing screen is showing again), fire off
                 * account created delegate event.
                 **/
                self.delegate?.accountCreated(forUser: self.emailTextField.text)
            })
        } else {
            // Account creation failed
        }
    }
    
    /** Custom Functions **/
    
    func tryCreateAccount() -> Bool {
        
        // Do the creation stuff here
        /**
         * To-Do:
         * Add conditions that return false if the username or password
         * text fields have no entered text
         
         * Bonus points: update the feedback text field to provide
            appropriate feedback and to direct the user to complete
            the form.
         **/
        
        return true
    }
}
