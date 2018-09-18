//
//  ClassDemoVC.swift
//  refactorDojo
//
//  Created by Keithon Stribling on 9/18/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class ClassDemoVC: UIViewController {
	
	/** Properties **/
	
	@IBOutlet weak var defaultBtn1: DefaultBtn!
	
	
	
	/** Overrides **/
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		createNewBtn(yOrgin: 0, labelText: "Yo!")
		createNewBtn(yOrgin: 125, labelText: "The other one...")
    }
	
	func createNewBtn(yOrgin: CGFloat, labelText: String) {
		
		let btnFrame = CGRect(x: 15, y: yOrgin, width: self.view.frame.width - 30, height: 100)
		
		let newBtn = DefaultBtn.init(frame: btnFrame)
		// keithon note: I was able to pass in 'btnFrame' into 'newBtn' because it was of Type 'Frame'
		newBtn.setTitle(labelText, for: .normal)
		self.view.addSubview(newBtn)
		
	}
}
