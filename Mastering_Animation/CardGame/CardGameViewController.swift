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
    
    static let noti = Notification.Name.init("Noti")
    var cardFlipped = false
    var compareCard: Array<CardGameCollectionViewCell> = []
    var matchedCount = 0
    
    lazy var cardCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.register(CardGameCollectionViewCell.self, forCellWithReuseIdentifier: "CardGameCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        collectionView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        return collectionView
    }()
    lazy var underBar: UINavigationBar = {
        var naviBar = UINavigationBar()
        return naviBar
    }()
    lazy var gameStartButton: UIBarButtonItem = {
        var button = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(gameStart))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    //MARK:- Configure Layout
    private func setLayout() {
        setNaviItem()
        view.addSubview(cardCollectionView)
        view.addSubview(underBar)
        
        underBar.snp.makeConstraints { (con) in
            con.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            con.leading.equalToSuperview()
            con.trailing.equalToSuperview()
        }
        
        cardCollectionView.snp.makeConstraints { (con) in
            con.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            con.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            con.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            con.bottom.equalTo(underBar.snp.top)
        }
    }
    private func setNaviItem() {
        self.title = "00:00:00"
        self.navigationItem.rightBarButtonItem = gameStartButton
    }
    private func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize.width = view.frame.width / 4
        layout.itemSize.height = view.frame.height / 5
        layout.minimumInteritemSpacing = 10
        
        return layout
    }
}

//MARK:- CollectionViewDelegate, DataSource
extension CardGameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CardImageSetModel.cardImageSet.cardSet.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardGameCollectionViewCell", for: indexPath) as! CardGameCollectionViewCell
        cell.configure(image: CardImageSetModel.cardImageSet.cardSet[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CardGameCollectionViewCell
        compareCards(cell)
    }
    
    private func compareCards(_ cell: CardGameCollectionViewCell) {
        
        if !cardFlipped {   // 첫 번째 카드
            cell.flipCard(false, secondImageView: nil)
            compareCard.append(cell)
            cardFlipped = true
            
        } else if cardFlipped { // 두 번째 카드
            compareCard.append(cell)
            if compareCard[0].frontImageView.image == compareCard[1].frontImageView.image { //맞았을 때
                compareCard[1].flipCard(false, secondImageView: nil)
                compareCard.removeAll()
                matchedCount += 1
                guard matchedCount != 6 else {
                    alertSuccess()
                    return
                }
            } else { // 안맞았을 때 이미 하난 뒤집혀 있음
                compareCard[1].flipCard(true, secondImageView: compareCard[0])
                compareCard.removeAll()
            }
            cardFlipped = false
        }
    }
    func alertSuccess() {
        let success = UIAlertAction.init(title: "닫기", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
            let action = UIAlertController.init(title: "성공", message: "성공", preferredStyle: .alert)
            action.addAction(success)
            self.present(action, animated: true, completion: nil)
        }
    }
    //MARK:- Button Action
    extension CardGameViewController {
        @objc func gameStart() {
            //shuffleCard()
            timeStart()
            flipAllCard()
        }
        private func shuffleCard() {
            CardImageSetModel.cardImageSet.cardSet.shuffle()
            UIView.animate(withDuration: 3) {
                self.cardCollectionView.reloadData()
            }
        }
        private func timeStart() {
            var runCount = 0
            let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
                runCount += 1
                let seconds = runCount % 60
                let minutes = (runCount / 60) % 60
                let hours = runCount / 3600
                let strHours = hours > 9 ? String(hours) : "0" + String(hours)
                let strMinutes = minutes > 9 ? String(minutes) : "0" + String(minutes)
                let strSeconds = seconds > 9 ? String(seconds) : "0" + String(seconds)
                DispatchQueue.main.async {
                    self.title = "\(strHours):\(strMinutes):\(strSeconds)"
                }
            }
            timer.fire()
        }
        private func flipAllCard() {
            NotificationCenter.default.post(name: CardGameViewController.noti, object: nil)
        }
}
