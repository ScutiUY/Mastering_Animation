//
//  CardGameViewController.swift
//  Mastering_Animation
//
//  Created by 신의연 on 2020/07/18.
//  Copyright © 2020 Koggy. All rights reserved.
//

import UIKit
import SnapKit
class CardGameViewController: UIViewController {

    var viewArr = [UIView]()
    lazy var redView: UIView = {
        var redView = UIView()
        return redView
    }()
    override func loadView() {
        super.loadView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(redView)
        redView.snp.makeConstraints { (m) in
            m.top.equalTo(view.snp.top).offset(20)
            m.leading.equalTo(view.snp.leading).offset(20)
            m.width.equalTo(50)
            m.height.equalTo(50)
        }
        // Do any additional setup after loading the view.
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
