//
//  AccountSignupVC.swift
//  refactorDojo
//
//  Created by Keithon Stribling on 9/4/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

/**
 * If a class is a blueprint for an object,
 * a protocol is a blueprint for a delegate
 
 * This protocol definition (usually placed above the class definition),
 * will be used to alert any surrounding display about the new user account
 **/
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
    
    /**
     * Here, we add a delegate property to our main class to allow
     * any views conforming to our protocol (in our case, the LandingVC),
     * to hook into this and listen to any explicitly created instance
     * of this AccountSignupVC class.
     **/
    weak var delegate : AccountSignupVCDelegate?
    
	override func viewDidLoad() {
		super.viewDidLoad()
		
        backButton.imageView?.contentMode = .scaleAspectFit
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
        
		let characterCount = 8
		let passwordCountMin = (passwordTextField.text?.count)! < characterCount
		
		if (emailTextField.text?.isEmpty)! {
			feedbackLabel.text = "Missing Email Address"
			return false
		} else if passwordCountMin {
			feedbackLabel.text = "Password must be \n at least 8 characters"
			return false
		}
        return true
    }
}
