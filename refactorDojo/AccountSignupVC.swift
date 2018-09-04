//
//  AccountSignupVC.swift
//  refactorDojo
//
//  Created by Keithon Stribling on 9/4/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class AccountSignupVC: UIViewController {
	
	/** Properties **/
	
	@IBOutlet weak var backButton: UIButton!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
        backButton.imageView?.contentMode = .scaleAspectFit
    }
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	/** Action **/
	
	@IBAction func backButtonPress(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
	}
}
