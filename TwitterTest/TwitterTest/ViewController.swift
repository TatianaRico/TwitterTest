//
//  ViewController.swift
//  TwitterTest
//
//  Created by Tatiana Rico on 23/09/21.
//  Copyright © 2021 Tatiana Rico. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Attributes
    let controller = TwitterController()
    var nameTextField: String?
    
    //MARK: - Layout Attributes
    fileprivate var searchName: UITextField = {
        let searchName = UITextField()
        searchName.keyboardType = .default
        searchName.borderStyle = .roundedRect
        searchName.returnKeyType = .done
        searchName.placeholder = "Digite um usuario do Twitter"
        searchName.becomeFirstResponder()
        return searchName
    }()
    
    fileprivate var searchBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Procurar", for: .normal)
        btn.tintColor = .black
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(actionBtn), for: .touchUpInside)
        return btn
    }()
    
    fileprivate var tableView = UITableView()
    
    //MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContrains()
        setupTextField()
        setupTableView()
    }
    
    //MARK: - SetupCOntrains
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
    
    //MARK: - Setup Functions
    fileprivate func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(TwitterTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    fileprivate func setupTextField() {
        self.searchName.delegate = self
    }
 
   fileprivate func getUserTwitter() {
    guard let name = searchName.text else { return }
    self.controller.getRequestUserTwitter(name: name) { (sucess, model) in
            if sucess {
                guard let model = model , let id = model.id else { return }
                self.getId(id: id)
            } else {
                self.tableView.reloadData()
        }
        }
    }
    
   fileprivate func getId(id: String) {
        self.controller.getIdUserTwitter(id: id) { (sucess) in
            if sucess{
                self.tableView.reloadData()
            }
        }
    }
    
    @objc func actionBtn() {
        searchName.resignFirstResponder()
        self.getUserTwitter()
    }
}

//MARK: - UITableView Extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TwitterTableViewCell else { return UITableViewCell()}
        cell.setupCell(model: controller.cellForItem(indexPath: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
}

//MARK: - UITextFielDelegate Extension
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchName.resignFirstResponder()
        return true
    }
}

