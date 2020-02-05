//
//  HomeVC.swift
//  Green-K
//
//  Created by Wissa Azmy on 11/16/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import UIKit
import UIReactor

struct Category {
    let name: String
    let image: String
}

struct Candy {
    let name: String
}

class HomeVC: UIViewController {
    
    var categories = [Category]()
    let candies = [
        Candy(name: "Milk"),
        Candy(name: "Pepsi"),
        Candy(name: "Tuna"),
        Candy(name: "Meat"),
        Candy(name: "Juice"),
        Candy(name: "Cheese"),
        Candy(name: "Eggs"),
        Candy(name: "Flour")
    ]
    
    var filteredCandies: [Candy] = []
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    let resultVC = SearchResultsVC()
    
    var searchController = UISearchController(searchResultsController: nil)
    var categoriesTableView: UITableView!

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "FresKo"
        setupNavigationBarView()
        searchController = UISearchController(searchResultsController: resultVC)
        setupSearchController()
        prepareCategoriesData()
        setupCategoriesTableView()
        view.addSubview(categoriesTableView)
        activateConstraints()
    }


    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = "Search K Market"
        searchController.hidesNavigationBarDuringPresentation = false
        self.navigationItem.hidesSearchBarWhenScrolling = false // To make the search bar always visible
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
    }
    
    func setupNavigationBarView() {
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationItem.title = title
        navigationController?.navigationBar.prefersLargeTitles = false
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.isTranslucent = false
    }
    
    func prepareCategoriesData() {
        let hospitals = Category(name: "Hospitals", image: "meat")
        let salons = Category(name: "Beauty & Hail Salon", image: "grocery")
        let banks = Category(name: "Banks", image: "drinks")
        let retails = Category(name: "Retails", image: "dairy")
        categories.append(hospitals); categories.append(salons); categories.append(banks); categories.append(retails)
    }

}



extension HomeVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredCandies = candies.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        resultVC.updateResults(data: filteredCandies)
    }
}



extension HomeVC {
    fileprivate func setupCategoriesTableView() {
        categoriesTableView = ReactorTableView(items: categories, frame: view.frame, rowHeight: 200, configure: { (cell: CategoryCell, category: Category) in
            cell.configCell(withDataOf: category)
        }, selectHandler: { (category: Category) in
            print(category.name)
        })
        categoriesTableView.backgroundColor = .white
    }
    
    fileprivate func activateConstraints() {
        NSLayoutConstraint.activate([
            categoriesTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            categoriesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            categoriesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            categoriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}
