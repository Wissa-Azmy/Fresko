//
//  SearchResultsVC.swift
//  Green-K
//
//  Created by Wissa Azmy on 11/16/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import UIKit
import UIReactor

class SearchResultsVC: UIViewController {
    
    var filteredCandies = [Candy(name: "Hello"),Candy(name: "Bellow")]
    
    var searchResultsTableView: ReactorTableView<Candy, UITableViewCell>!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCategoriesTableView()
        view.addSubview(searchResultsTableView)
        activateConstraints()
        searchResultsTableView.tableFooterView = UIView()
    }

}


extension SearchResultsVC {
    fileprivate func setupCategoriesTableView() {
        searchResultsTableView = ReactorTableView(items: filteredCandies, frame: view.frame, rowHeight: 40, configure: { (cell: UITableViewCell, item: Candy) in
            cell.textLabel?.text = item.name
        }, selectHandler: { (item: Candy) in
            print(item.name)
        })
        searchResultsTableView.backgroundColor = .white
        searchResultsTableView.separatorColor = .black
    }
    
    fileprivate func activateConstraints() {
        NSLayoutConstraint.activate([
            searchResultsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            searchResultsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            searchResultsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            searchResultsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

extension SearchResultsVC {
    func updateResults(data: [Candy]) {
        searchResultsTableView.reload(withDataOf: data)
    }
}
