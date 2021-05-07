//
//  Header.swift
//  QuestionnaireApp_UITableView
//
//  Created by Mospeng Research Lab Philippines on 6/11/20.
//  Copyright © 2020 Mospeng Research Lab Philippines. All rights reserved.
//

import Foundation
import UIKit

class Header: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let headerLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.boldSystemFont(ofSize: 14)
       return label
    }()
    
    func setupViews() {
        addSubview(headerLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]|", views: headerLabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: headerLabel)
    }
}
