//
//  StoreVC.swift
//  Green-K
//
//  Created by Wissa Azmy on 11/17/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import UIKit

class StoreVC: UIViewController {
    
    let awarenessTableView = UITableView()
    let segmentControl = UISegmentedControl(items: ["Home","Basket"])
    
    override func loadView() {
            view = UIView()
            view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
            
            awarenessTableView.translatesAutoresizingMaskIntoConstraints = false
            awarenessTableView.dataSource = self
            awarenessTableView.delegate = self
            awarenessTableView.register(ProductCell.self, forCellReuseIdentifier: "awarenessCell")
            awarenessTableView.separatorColor = UIColor.clear
            awarenessTableView.estimatedRowHeight = 50
            awarenessTableView.rowHeight = UITableView.automaticDimension
            awarenessTableView.backgroundColor = UIColor.clear
            awarenessTableView.clipsToBounds = false
            view.addSubview(awarenessTableView)
            
            
            segmentControl.translatesAutoresizingMaskIntoConstraints = false
            segmentControl.selectedSegmentIndex = 0
            segmentControl.tintColor = #colorLiteral(red: 0, green: 0.7156304717, blue: 0.9302947521, alpha: 1)
            segmentControl.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            segmentControl.layer.borderWidth = 1
            segmentControl.layer.borderColor = #colorLiteral(red: 0, green: 0.7156304717, blue: 0.9302947521, alpha: 1)
            segmentControl.layer.cornerRadius = 3
            segmentControl.addTarget(self, action: #selector(indexChanged), for: .valueChanged)
            view.addSubview(segmentControl)
            
            NSLayoutConstraint.activate([
                segmentControl.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
                segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
                segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
                
                awarenessTableView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 30),
                awarenessTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                awarenessTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
                awarenessTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            title = "My Store"
            setupView()
        }
        
        func setupView() {
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
            let notificationBtn = UIButton(type: .custom)
            notificationBtn.setImage(UIImage(named: "blueNotificationIcon"), for: .normal)
            notificationBtn.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: notificationBtn)
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0.7115641236, blue: 0.930534184, alpha: 1)
            navigationController?.navigationBar.isTranslucent = false
        }
       
        
        @objc func indexChanged(_ sender: UISegmentedControl) {
            //TODO: switch between data
            
        }
}




extension StoreVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: change return to array.count
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "awarenessCell", for: indexPath) as! ProductCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
        
        let radius = cell.contentView.layer.cornerRadius
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
    }
}
