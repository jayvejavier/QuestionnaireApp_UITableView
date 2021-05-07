//
//  QuestionViewController.swift
//  QuestionnaireApp_UITableView
//
//  Created by Mospeng Research Lab Philippines on 6/10/20.
//  Copyright © 2020 Mospeng Research Lab Philippines. All rights reserved.
//

import UIKit

var questionsList: [Question] = [
        Question(questionString: "What is your favorite type of food?", answers: ["Seafood", "Meat", "Vegetables", "All of the above"], selectedAnswerIndex: nil),
        Question(questionString: "What do you do for a living?", answers: ["Paleontologist", "Actor", "Chef", "Waitress"], selectedAnswerIndex: nil),
        Question(questionString: "Where you on a break?", answers: ["Yes", "No"], selectedAnswerIndex: nil)
    ]

class QuestionViewController: UITableViewController {
    
    static let cellId = "cellId"
    static let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let index = navigationController?.viewControllers.firstIndex(of: self) {
                navigationItem.title = "Question \(index + 1)/\(questionsList.count)"
        }
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        navigationController?.navigationBar.barTintColor = .orange
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        
        // To set top navigation in white color
        navigationController?.navigationBar.barStyle = .black
        
        tableView?.register(Cell.self, forCellReuseIdentifier: QuestionViewController.cellId)
        tableView?.register(Header.self, forHeaderFooterViewReuseIdentifier: QuestionViewController.headerId)
        
        tableView?.sectionHeaderHeight = 50
        tableView?.rowHeight = 50
        
        // To show cell with label only
        tableView?.tableFooterView = UIView()
        
        
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let index = navigationController?.viewControllers.firstIndex(of: self) {
            let question = questionsList[index]
            if let count = question.answers?.count {
               return count
            }
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionViewController.cellId, for: indexPath) as! Cell
        if let index = navigationController?.viewControllers.firstIndex(of: self) {
            let question =  questionsList[index]
            cell.answerLabel.text = question.answers?[indexPath.row]
        }
        return cell
    }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Sample Question"
//    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: QuestionViewController.headerId) as! Header
        
        if let index = navigationController?.viewControllers.firstIndex(of: self) {
            let question =  questionsList[index]
            header.headerLabel.text = question.questionString
        }
        return header
    }
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let index = navigationController?.viewControllers.firstIndex(of: self) {
            questionsList[index].selectedAnswerIndex = indexPath.row
            if index < questionsList.count - 1 {
                let questionController = QuestionViewController()
                navigationController?.pushViewController(questionController, animated: true)
            }
            else {
                let controller = ResultsViewController()
                navigationController?.pushViewController(controller, animated: true)
            }
        }
    }

    
}

extension UIView {
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

