//
//  FloatingButtonCollectionViewCell.swift
//  Mastering_Animation
//
//  Created by 신의연 on 2020/07/27.
//  Copyright © 2020 Koggy. All rights reserved.
//

import UIKit

class FloatingButtonCollectionViewCell: UICollectionViewCell {
    
    var photoImageView: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("fatal Error")
    }
    
    
}
