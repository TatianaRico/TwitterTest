//
//  twitterTableViewCell.swift
//  TwitterTest
//
//  Created by Tatiana Rico on 24/09/21.
//  Copyright © 2021 Tatiana Rico. All rights reserved.
//

import UIKit

class TwitterTableViewCell: UITableViewCell {
    //MARK: Atributtes    
    fileprivate let textLb: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        return lb
    }()
    
    //MARK: Setup Functions
    fileprivate func setupConstrains() {
        contentView.addSubview(textLb)
        textLb.translatesAutoresizingMaskIntoConstraints = false
        let leadingConstraint = NSLayoutConstraint(item: textLb, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 20)
        let trailingConstraint = NSLayoutConstraint(item: textLb, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: -20)
        let topMarginConstraint = NSLayoutConstraint(item: textLb, attribute: .topMargin, relatedBy: .equal, toItem: contentView.safeAreaLayoutGuide, attribute: .topMargin, multiplier: 1,  constant: 20)
        let heightConstraint = NSLayoutConstraint(item: textLb, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        contentView.addConstraints([leadingConstraint, trailingConstraint,  topMarginConstraint, heightConstraint])
    }
    
    public func setupError() {
        setupConstrains()
        textLb.text = "Não achamos nenhum twitter, verifique o nome do usuario e tente novamente."
    }
    
    public func setupCell(model: MsgTwitter) {
        setupConstrains()
            textLb.text = model.text
    }
}
