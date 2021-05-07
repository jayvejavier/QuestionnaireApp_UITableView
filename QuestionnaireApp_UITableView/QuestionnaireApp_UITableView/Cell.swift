//
//  Cell.swift
//  QuestionnaireApp_UITableView
//
//  Created by Mospeng Research Lab Philippines on 6/10/20.
//  Copyright © 2020 Mospeng Research Lab Philippines. All rights reserved.
//

import Foundation
import UIKit

class Cell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let answerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    func setupViews() {
        accessoryType = .disclosureIndicator
        addSubview(answerLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]|", views: answerLabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: answerLabel)
    }
}


