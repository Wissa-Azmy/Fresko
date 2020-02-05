//
//  MenuVC.swift
//  Green-K
//
//  Created by Wissa Azmy on 11/16/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    var tableView: UITableView!

        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Menu"
            // Uncomment the following line to preserve selection between presentations
            // self.clearsSelectionOnViewWillAppear = false

            // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
            // self.navigationItem.rightBarButtonItem = self.editButtonItem
            setupView()
            setupTableView()
        }
        
        func setupView() {
            view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.7156304717, blue: 0.9302947521, alpha: 1)
            navigationItem.title = "Menu"
            
            let notificationBtn = UIButton(type: .custom)
            notificationBtn.setImage(UIImage(named: "notificationIcon"), for: .normal)
            notificationBtn.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: notificationBtn)
            navigationController?.navigationBar.isTranslucent = false
        }
        
        fileprivate func setupTableView() {
            tableView = UITableView(frame: view.frame, style: .plain)
            tableView.tableFooterView = UIView()
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "settingsCell")
            tableView.register(LanguageCell.self, forCellReuseIdentifier: "languageCell")
            tableView.delegate = self
            tableView.dataSource = self
            view.addSubview(tableView)
        }
        
        
    }

    // MARK: - Table view data source
    extension MenuVC: UITableViewDataSource {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath)
            // Configure the cell...
            
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath) as! LanguageCell
                cell.textLabel?.text = NSLocalizedString("Language", comment: "")
                cell.imageView?.image = UIImage(named: "langauge")
                cell.selectionStyle = .none
                cell.titleLbl.textColor = .darkGray
                return cell
            case 1:
                cell.textLabel?.text = NSLocalizedString("Privacy Policy", comment: "")
                cell.detailTextLabel?.text = ""
                cell.imageView?.image = UIImage(named: "privacy")
            case 2:
                cell.textLabel?.text = NSLocalizedString("Log out", comment: "")
                cell.detailTextLabel?.text = ""
                cell.imageView?.image = UIImage(named: "logout")
            default:
                break
            }
            cell.textLabel?.textColor = .darkGray
            
            return cell
        }
    }

    // MARK: - Table View Delegate
    extension MenuVC: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            switch indexPath.row {
            case 0:
                
                break
            case 1:
                
                break
            case 2:
                let alertController = UIAlertController(
                    title: NSLocalizedString("Log out", comment: ""),
                    message: NSLocalizedString("Are You Sure You Want To Log out?", comment: ""),
                    preferredStyle: .alert
                )
                let action1 = UIAlertAction(title: NSLocalizedString("Yes", comment: ""), style: .default) { (_: UIAlertAction) in
    //                (UIApplication.shared.delegate as? AppDelegate)?.signOut()
                }
                
                let action2 = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel)
                
                alertController.addAction(action1)
                alertController.addAction(action2)
                self.present(alertController, animated: true, completion: nil)
            default:
                break
            }
        }
    }
