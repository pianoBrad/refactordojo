//
//  chooseYourGoatVC.swift
//  refactorDojo
//
//  Created by Brad Phillips on 9/15/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol chooseYourGoatVCDelegate: class {
    
    func goatSelected(named: String)
}
class chooseYourGoatVC: UIViewController {

    /****************** Properties ******************/
    
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var mjOption: goatOptionView!
    @IBOutlet weak var lbjOption: goatOptionView!
    
    weak var chooseGoatDelegate : chooseYourGoatVCDelegate?
    
    /****************** Overrides ******************/
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        closeBtn.imageView?.contentMode = .scaleAspectFit
        mjOption.goatOptionDelegate = self
        lbjOption.goatOptionDelegate = self
    }

    /****************** Actions ******************/
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension chooseYourGoatVC : goatOptionViewDelegate {
    
    /****************** Delegate Methods ******************/
    
    func goatOptionTapped(_ sender: goatOptionView) {
        
        self.chooseGoatDelegate?.goatSelected(named: sender.name)
        self.dismiss(animated: true, completion: nil)
    }
}
