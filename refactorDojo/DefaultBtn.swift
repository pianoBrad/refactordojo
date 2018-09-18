//
//  DefaultBtn.swift
//  refactorDojo
//
//  Created by Keithon Stribling on 9/18/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class DefaultBtn: UIButton {

	var bgColor : UIColor = .red
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = bgColor
		self.setTitle("Yo!", for: .normal)

	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
	}

}
