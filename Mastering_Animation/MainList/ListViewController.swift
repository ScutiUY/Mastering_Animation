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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    
        // Do any additional setup after loading the view.
    }
    
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
        if indexPath.row == 0 {
            navigationController?.pushViewController(CardGameViewController(), animated: true)
        }
    }
}
