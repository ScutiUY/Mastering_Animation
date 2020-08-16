//
//  FadeAwayPresentationViewController.swift
//  Mastering_Animation
//
//  Created by 신의연 on 2020/08/09.
//  Copyright © 2020 Koggy. All rights reserved.
//

import UIKit

class FadeAwayPresentationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.modalPresentationStyle = .custom
        segue.destination.transitioningDelegate = self
    }
    

}


extension FadeAwayPresentationViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return FadeAwayPresentation(presentedViewController: presented, presenting: presenting)
    }
}
