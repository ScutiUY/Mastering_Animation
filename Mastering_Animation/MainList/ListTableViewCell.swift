//
//  ListTableViewCell.swift
//  Mastering_Animation
//
//  Created by 신의연 on 2020/07/14.
//  Copyright © 2020 Koggy. All rights reserved.
//

import UIKit
import SnapKit
class ListTableViewCell: UITableViewCell {
    
    private let title: UILabel = {
        var label = UILabel()
        return label
    }()

 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        setLayout()
    }
    
    func setLayout() {
        contentView.addSubview(title)
        
        title.snp.makeConstraints{ (m) in
            m.leading.equalTo(contentView.snp.leading).offset(20)
            m.trailing.equalTo(contentView.snp.trailing).offset(-5)
            m.centerY.equalToSuperview()
        }
    }
    func configureCell(model: String) {
        title.text = model
    }
    
}

