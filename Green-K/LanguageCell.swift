//
//  LanguageCell.swift
//  Green-K
//
//  Created by Wissa Azmy on 11/16/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import UIKit
import UIReactor

class LanguageCell: UITableViewCell {

   let mainView: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 8
            view.layer.masksToBounds = true
            view.translatesAutoresizingMaskIntoConstraints = false
            view.clipsToBounds = false // this will make sure its children do not go out of the boundary
            return view
        }()
        
        var cellIcon : UIImageView = {
            let icon = UIImageView(image: UIImage(named: "langauge"))
            icon.contentMode = .scaleAspectFit
            icon.translatesAutoresizingMaskIntoConstraints = false
            return icon
        }()
        
        let titleLbl: UILabel = UIReactor.fuseLabel()
        let langSegmentedControl = UISegmentedControl(items: ["English", "Finnish"])
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
        }
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupCell()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        fileprivate func setupCell() {
            if Bundle.main.preferredLocalizations.first == "ar" {
                langSegmentedControl.setEnabled(true, forSegmentAt: 1)
            } else {
                langSegmentedControl.setEnabled(true, forSegmentAt: 0)
            }
            
            langSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
            langSegmentedControl.selectedSegmentIndex = 0
            langSegmentedControl.layer.borderWidth = 1
            langSegmentedControl.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            langSegmentedControl.layer.cornerRadius = 3
            
            langSegmentedControl.addTarget(self, action: #selector(indexChanged), for: .valueChanged)
            
            contentView.addSubViews(cellIcon, titleLbl, langSegmentedControl)
    //        contentView.addSubViews(mainView)
            
            NSLayoutConstraint.activate([
                cellIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                cellIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 20),
                
                titleLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                titleLbl.leadingAnchor.constraint(equalTo: cellIcon.trailingAnchor, constant: 20),
                
                langSegmentedControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                langSegmentedControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            ])
        }
        
        @objc func indexChanged(_ sender: UISegmentedControl) {
            
        }
}


extension UIView {
    func addSubViews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
