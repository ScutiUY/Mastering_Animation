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
        imageView.contentMode = .scaleAspectFit
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
        
    }
    
    func configure(image: UIColor) {
        backImageView.backgroundColor = image
        frontImageView.image = UIImage(named: "Question_mark")
    }
}
