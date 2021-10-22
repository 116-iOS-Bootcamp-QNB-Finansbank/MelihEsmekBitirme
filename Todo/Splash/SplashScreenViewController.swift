//
//  SplashScreenViewController.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 20.10.2021.
//

import UIKit
import Hero

class SplashScreenViewController: UIViewController {
   

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        label.text = ""
        let titleText = "Welcome"
        var charIndex = 0.0
        
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex, repeats: false) { (timer) in
                
                self.label.text?.append(letter)
                
            }
            charIndex += 1
        }
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            let viewController = TaskListBuilder.build()
            self.navigationController?.pushViewController(viewController, animated: true)
            viewController.modalPresentationStyle = .fullScreen
            viewController.modalTransitionStyle = .flipHorizontal
            UIView.animate(withDuration: 1.0, delay: 0.8, options: .autoreverse, animations: {
                self.view.alpha = 0
            } ,completion: nil )
        }
   

            
        }
    
    }
    
