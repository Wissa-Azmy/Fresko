//
//  CartVC.swift
//  Green-K
//
//  Created by Wissa Azmy on 11/17/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import UIKit
import UIReactor

class CartVC: UIViewController {
    
    var candyList = [Candy]()
    var categoryList = [
        Candy(name: "one"),
        Candy(name: "two"),
        Candy(name: "three"),
        Candy(name: "four"),
        Candy(name: "five"),
        Candy(name: "six"),
        Candy(name: "seven"),
        Candy(name: "eight")
    ]
    var activityIndicator: UIActivityIndicatorView!
    var shoppingcartTableView: ReactorTableView<Candy, CartItemCell>!
    var nextRadiologyTile: ReactorTile!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "Shopping Cart"
        setupshoppingcartTableView()
        activityIndicator = UIReactor.showActivityIndicator(on: view)
        activityIndicator.startAnimating()
        setupLastRadiologyTile()
        view.addSubview(nextRadiologyTile)
        activateConstraints()
    }
    
    fileprivate func setupshoppingcartTableView() {
        shoppingcartTableView = ReactorTableView(items: categoryList, frame: view.frame, rowHeight: 80, configure: { (cell, category) in
            cell.configCell(withDataOf: category)
        }, selectHandler: { (category) in
            self.navigationController?.pushViewController(StoresVC(), animated: true)
        })
        shoppingcartTableView.backgroundColor = .white
        view.addSubview(shoppingcartTableView)
    }
    
    fileprivate func setupLastRadiologyTile() {
        nextRadiologyTile = ReactorTile()
        nextRadiologyTile.headerLbl.text = "Cart Summary"
        nextRadiologyTile.titleLbl.text = "No. of Items: 7"
        nextRadiologyTile.descriptionLbl.text = "Total Price: 30 $"
        nextRadiologyTile.iconImgView.image = UIImage(named: "medicationIcon")
    }
    
    fileprivate func activateConstraints() {
        NSLayoutConstraint.activate([
            nextRadiologyTile.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor , constant: 20),
            nextRadiologyTile.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextRadiologyTile.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextRadiologyTile.heightAnchor.constraint(equalToConstant: 110),
            
            shoppingcartTableView.topAnchor.constraint(equalTo: nextRadiologyTile.bottomAnchor, constant: 30),
            shoppingcartTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            shoppingcartTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            shoppingcartTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

}
