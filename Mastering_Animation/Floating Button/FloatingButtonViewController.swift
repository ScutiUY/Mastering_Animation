//
//  FloatingButtonViewController.swift
//  Mastering_Animation
//
//  Created by 신의연 on 2020/07/21.
//  Copyright © 2020 Koggy. All rights reserved.
//

import UIKit
import SnapKit

class FloatingButtonViewController: UIViewController {
    
    static let noti = Notification.Name("noti")
    
    var redView: UIView = {
        var redView = UIView()
        redView.backgroundColor = .red
        return redView
    }()
    
    var blueView: UIView = {
        var redView = UIView()
        redView.backgroundColor = .blue
        return redView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let containerView = UIView()
        
        view.addSubview(blueView)
        view.addSubview(containerView)
        
        containerView.addSubview(redView)
        
        
        containerView.snp.makeConstraints { (con) in
            con.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            con.leading.equalTo(view.snp.leading).offset(10)
            con.trailing.equalTo(view.snp.trailing).offset(-10)
            con.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
        
        redView.snp.makeConstraints { (con) in
            con.width.equalToSuperview()
            con.height.equalToSuperview()
            con.center.equalToSuperview()
        }
        blueView.snp.makeConstraints { (con) in
            con.width.equalTo(100)
            con.height.equalTo(100)
            con.center.equalToSuperview()
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(flip))
        redView.addGestureRecognizer(tap)
        redView.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }
    @objc func flip() {
        NotificationCenter.default.post(name: FloatingButtonViewController.noti, object: nil)
        UIView.transition(from: self.redView, to: self.blueView, duration: 1, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: { (trans) in
            UIView.transition(from: self.blueView, to: self.redView, duration: 1, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        })
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
