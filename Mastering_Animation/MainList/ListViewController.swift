//
//  ViewController.swift
//  Mastering_Animation
//
//  Created by 신의연 on 2020/07/13.
//  Copyright © 2020 Koggy. All rights reserved.
//

import UIKit
import SnapKit

class ListViewController: UIViewController {
    
    private lazy var listTableview: UITableView = {
        var tableview = UITableView()
        tableview.backgroundColor = .lightGray
        return tableview
    }()
    
    enum ListOfAnimation: Int {
        case CardGame, FloatingButton, BloomingTransition, RealTimeBezierGraphic, SideMenu, CopyAppStore, FadeAwayPresentation
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
        
        // Do any additional setup after loading the view.
    }
    //MARK:- figuring layout
    private func setLayout() {
        view.addSubview(listTableview)
        
        listTableview.snp.makeConstraints { (m) in
            m.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            m.width.equalToSuperview()
            m.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        setTableView()
    }
    
    func setTableView() {
        listTableview.delegate = self
        listTableview.dataSource = self
        listTableview.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
    }
    
}
//MARK:- TableView Method
extension ListViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableViewModel.shared.title.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = TableViewModel.shared.title[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell
        cell?.configureCell(model: model)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listTableview.deselectRow(at: indexPath, animated: true)
        let menu: ListOfAnimation = ListViewController.ListOfAnimation(rawValue: indexPath.row)!
        
        switch menu {
        case .CardGame:
            let vc = UIStoryboard(name: "CardGameSB", bundle: nil).instantiateViewController(withIdentifier: "CardGameSB")
            navigationController?.pushViewController(vc, animated: true)
            
        case .BloomingTransition:
            let bloomingVC = UIStoryboard(name: "BloomingStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "BloomingStoryBoard")
            navigationController?.pushViewController(bloomingVC, animated: true)
            
        case .CopyAppStore:
            let appStoreVC = UIStoryboard(name: "AppStoreSB", bundle: nil).instantiateViewController(withIdentifier: "AppStoreSB")
            navigationController?.pushViewController(appStoreVC, animated: true)
            
        case .FloatingButton:
            let vc = UIStoryboard(name: "FloatingButtonSB", bundle: nil).instantiateViewController(withIdentifier: "FloatingButtonSB")
            navigationController?.pushViewController(vc, animated: true)
            
        case .RealTimeBezierGraphic:
            return
        case .SideMenu:
            return
        case .FadeAwayPresentation:
            let fadeVC = UIStoryboard(name: "FadeAwayPresentationStoryboard", bundle: nil).instantiateViewController(withIdentifier: "FadeAwayPresentationStoryboard")
            navigationController?.pushViewController(fadeVC, animated: true)
        }
    }
}
