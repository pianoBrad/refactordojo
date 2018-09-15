//
//  whosGoatVC.swift
//  refactorDojo
//
//  Created by Brad Phillips on 9/15/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class whosGoatVC: UIViewController {

    /****************** Properties ******************/
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var pickGoatBtn: UIButton!
    
    @IBOutlet weak var mjText: UILabel!
    @IBOutlet weak var lbjText: UILabel!
    
    
    /****************** Overrides ******************/
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.mjText.text = ""
        self.lbjText.text = ""
    }
}

extension whosGoatVC : chooseYourGoatVCDelegate {
    
    /****************** Overrides ******************/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? chooseYourGoatVC {
            destination.chooseGoatDelegate = self
        }
    }
    
    /****************** Delegate Methods ******************/
    
    func goatSelected(named: String) {
        
        self.title = "You picked \(named)"
        self.mjText.text = ""
        self.lbjText.text = ""
        
        switch named {
        case "LBJ":
            self.bgImage.image = UIImage(named: "lbj")
            self.lbjText.text = "NOPE"
            self.pickGoatBtn.setTitle("TRY AGAIN", for: .normal)
            break
        default :
            self.bgImage.image = UIImage(named: "mj")
            self.mjText.text = "CORRECT!"
            self.pickGoatBtn.setTitle("CHANGED MY MIND", for: .normal)
        }
    }
}
