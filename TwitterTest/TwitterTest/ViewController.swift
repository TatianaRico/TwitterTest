//
//  ViewController.swift
//  TwitterTest
//
//  Created by Tatiana Rico on 23/09/21.
//  Copyright © 2021 Tatiana Rico. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate var searchName: UITextField = {
        let searchName = UITextField()
        searchName.keyboardType = .default
        searchName.borderStyle = .roundedRect
        searchName.returnKeyType = .done
        searchName.placeholder = "Digite aqui um nome"
        return searchName
    }()
    
    fileprivate var searchBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Procurar", for: .normal)
        btn.tintColor = .black
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    fileprivate var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContrains()
    }
    
    fileprivate func setupContrains() {
        view.addSubview(searchName)
        view.addSubview(searchBtn)
        view.addSubview(tableView)
        
        searchName.translatesAutoresizingMaskIntoConstraints = false
        let leadingConstraint = NSLayoutConstraint(item: searchName, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20)
        let topMarginConstraint = NSLayoutConstraint(item: searchName, attribute: .topMargin, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .topMargin, multiplier: 1,  constant: 20)
        let heightConstraint = NSLayoutConstraint(item: searchName, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        view.addConstraints([leadingConstraint, topMarginConstraint, heightConstraint])
        
        searchBtn.translatesAutoresizingMaskIntoConstraints = false
        let leadingBtnConstraint = NSLayoutConstraint(item: searchBtn, attribute: .left, relatedBy: .equal, toItem: searchName, attribute: .right, multiplier: 1, constant: 10)
        let topMarginBtnConstraint = NSLayoutConstraint(item: searchBtn, attribute: .topMargin, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .topMargin, multiplier: 1,  constant: 20)
        let trailingBtnConstraint = NSLayoutConstraint(item: searchBtn, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -20)
        let heightBtnConstraint = NSLayoutConstraint(item: searchBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        let widthBtnConstraint = NSLayoutConstraint(item: searchBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        view.addConstraints([leadingBtnConstraint, topMarginBtnConstraint, trailingBtnConstraint, heightBtnConstraint, widthBtnConstraint])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let leadingTbConstraint = NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 10)
        let topMarginTbConstraint = NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: searchName, attribute: .bottom, multiplier: 1,  constant: 20)
        let trailingTbConstraint = NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -20)
        let heightTbConstraint = NSLayoutConstraint(item: tableView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 500)
        
        view.addConstraints([leadingTbConstraint, topMarginTbConstraint, trailingTbConstraint, heightTbConstraint])
    }
    
    fileprivate func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TwitterTableViewCell else { return UITableViewCell()}
        cell.textLabel?.text = "teste"
        return cell
    }
}

