//
//  AppStoreViewController.swift
//  Mastering_Animation
//
//  Created by 신의연 on 2020/07/21.
//  Copyright © 2020 Koggy. All rights reserved.
//

import UIKit

class AppStoreViewController: UIViewController {

    @IBOutlet weak var greenView: UIView!
    var topConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topConstraint = greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 600)
        widthConstraint = greenView.widthAnchor.constraint(equalToConstant: 50)
        heightConstraint = greenView.heightAnchor.constraint(equalToConstant: 100)
        topConstraint?.isActive = true
        widthConstraint?.isActive = true
        heightConstraint?.isActive = true
        
        
        
        view.layoutIfNeeded()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func action(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
            self.topConstraint?.isActive = false
            self.topConstraint = self.greenView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100)
            self.topConstraint?.isActive = true
            self.greenView.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
            self.view.layoutIfNeeded()
        }, completion: nil)

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
