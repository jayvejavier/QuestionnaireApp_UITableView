//
//  ResultsViewController.swift
//  QuestionnaireApp_UITableView
//
//  Created by Mospeng Research Lab Philippines on 6/11/20.
//  Copyright © 2020 Mospeng Research Lab Philippines. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    let resultsLabel: UILabel = {
        let label = UILabel()
        label.text = "Congratulations, you're a total Ross"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(done))
        
        view.backgroundColor = .white

        view.addSubview(resultsLabel)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: resultsLabel)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: resultsLabel)
        
        navigationItem.title = "Results"
        
        let names = ["Peter", "John", "Matthew", "Luke", "Paul", "Jude"]
        var score = 0
        for question in questionsList {
            score += question.selectedAnswerIndex!
        }
        let result = score % names.count
        resultsLabel.text = "Congratulations, you're personality is same with \(names[result])."
    
    }
    
    @objc func done() {
        navigationController?.popToRootViewController(animated: true)
    }

}
