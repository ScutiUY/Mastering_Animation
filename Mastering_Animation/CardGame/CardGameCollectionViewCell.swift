//
//  CardGameCollectionViewCell.swift
//  Mastering_Animation
//
//  Created by 신의연 on 2020/07/24.
//  Copyright © 2020 Koggy. All rights reserved.
//

import UIKit
import SnapKit

class CardGameCollectionViewCell: UICollectionViewCell {
    
    var comperCard: Array<UIImage> = []
    
    lazy var containerView: UIView = {
        var view = UIView()
        return view
    }()
    
    lazy var frontImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    lazy var backImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init error")
    }
    
    func setupLayout() {
        
        contentView.addSubview(containerView)
        
        containerView.addSubview(frontImageView)
        containerView.addSubview(backImageView)
        
        containerView.snp.makeConstraints { (con) in
            con.height.equalToSuperview()
            con.width.equalToSuperview()
            con.center.equalToSuperview()
        }
        
        frontImageView.snp.makeConstraints { (con) in
            con.height.equalToSuperview()
            con.width.equalToSuperview()
            con.center.equalToSuperview()
        }
        
        backImageView.snp.makeConstraints { (con) in
            con.height.equalToSuperview()
            con.width.equalToSuperview()
            con.center.equalToSuperview()
        }
        NotificationCenter.default.addObserver(forName: CardGameViewController.noti, object: nil, queue: .main) { (noti) in
            UIView.transition(from: self.backImageView, to: self.frontImageView, duration: 1, options: [.transitionFlipFromRight, .showHideTransitionViews]) { (animation) in
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
                    UIView.transition(from: self.frontImageView, to: self.backImageView, duration: 1, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
                }
            }
        }
    }
    
    func configure(image: UIImage) {
        frontImageView.image = image
        backImageView.image = UIImage(named: "Question_mark")
    }
    
    func flipCard(_ matched: Bool, secondImageView: CardGameCollectionViewCell?) {
        
        UIView.transition(from: backImageView, to: frontImageView, duration: 1, options: [.transitionFlipFromLeft, .showHideTransitionViews]){ (animation) in
            if matched {
                self.flipBack()
                UIView.transition(from: secondImageView!.frontImageView, to: secondImageView!.backImageView, duration: 1, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
            }
        }
    }
    func flipBack() {
        UIView.transition(from: frontImageView, to: backImageView, duration: 1, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
}
