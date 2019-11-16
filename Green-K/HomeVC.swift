//
//  HomeVC.swift
//  Green-K
//
//  Created by Wissa Azmy on 11/16/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigationBarView()
        setupSearchController()
    }


    func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Services"
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

}


extension HomeVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}
