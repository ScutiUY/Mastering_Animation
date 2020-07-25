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
    var runCount = 0
    var colorList: Array<UIColor> = [.red, .blue, .green, .brown, .orange, .purple, .black, .cyan]
    
    lazy var cardCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.register(CardGameCollectionViewCell.self, forCellWithReuseIdentifier: "CardGameCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        collectionView.autoresizesSubviews = true
        collectionView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        return collectionView
    }()
    
    lazy var gameStartButton: UIBarButtonItem = {
        var button = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(gameStart))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        
        // Do any additional setup after loading the view.
    }
    
    private func setLayout() {
        setNaviItem()
        view.addSubview(cardCollectionView)
        
        cardCollectionView.snp.makeConstraints { (con) in
            con.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            con.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            con.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            con.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func setNaviItem() {
        self.title = "00:00:00"
        self.navigationItem.rightBarButtonItem = gameStartButton
    }
    private func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize.width = 100
        layout.itemSize.height = 100
        layout.minimumInteritemSpacing = view.frame.size.width / 3
        layout.minimumLineSpacing = view.frame.size.height / 8
        
        return layout
    }
    private func timeStart() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.runCount += 1
            let seconds = self.runCount % 60
            let minutes = (self.runCount / 60) % 60
            let hours = self.runCount / 3600
            let strHours = hours > 9 ? String(hours) : "0" + String(hours)
            let strMinutes = minutes > 9 ? String(minutes) : "0" + String(minutes)
            let strSeconds = seconds > 9 ? String(seconds) : "0" + String(seconds)
            DispatchQueue.main.async {
                self.title = "\(strHours):\(strMinutes):\(strSeconds)"
            }
        }
        timer.fire()
    }
    private func cardFlip() {
 
    }
    
}

extension CardGameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardGameCollectionViewCell", for: indexPath) as! CardGameCollectionViewCell
        cell.configure(image: colorList[indexPath.row])
        return cell
    }
}

extension CardGameViewController {
    @objc func gameStart() {
        print("clicked")
        timeStart()
        func cardFlip() {
            
        }
    }
}
