//
//  goatOptionView.swift
//  refactorDojo
//
//  Created by Brad Phillips on 9/15/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol goatOptionViewDelegate: class {
    func goatOptionTapped(_ sender: goatOptionView)
}
@IBDesignable
class goatOptionView: UIView {
    
    /****************** Properties ******************/
    
    @IBInspectable public var name : String = "MJ" {
        didSet {}
    }
    
    @IBInspectable public var bgImage : UIImage = UIImage(named: "mj_dunk")! {
        didSet {
            self.addGoatBg()
        }
    }
    
    weak var goatOptionDelegate : goatOptionViewDelegate?
    
    
    /****************** Overrides ******************/
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.addGoatBg()
    }
    
    /****************** Custom Methods ******************/
    
    func addGoatBg() {
        
        let imageFrame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        let imageView = UIImageView(frame: imageFrame)
        imageView.image = self.bgImage
        imageView.contentMode = .scaleAspectFill
        
        for view in self.subviews {
            view.removeFromSuperview()
        }
        
        self.addSubview(imageView)
    }
    
    /****************** Actions ******************/
        
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.goatOptionDelegate?.goatOptionTapped(self)
    }
}
