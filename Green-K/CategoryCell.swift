//
//  CategoryCell.swift
//  Green-K
//
//  Created by Wissa Azmy on 11/16/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import UIKit
import UIReactor

class CategoryCell: UITableViewCell {

    let medicationLbl = UIReactor.fuseLabel()
    let medicationDetailsLbl = UIReactor.fuseLabel(txtColor: .gray)
    
    
    let medicactionIcon: UIImageView = {
        let icon = UIImageView(image: UIImage(named: "hospital"))
        icon.contentMode = .scaleAspectFill
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        layer.shadowOpacity = 0.08
        layer.shadowRadius = 20
        layer.shadowColor = UIColor.black.cgColor
        
        // add corner radius on `contentView`
        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = 8
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 15
        medicationLbl.font = UIFont(name: "AraJozoor-Regular", size: 12)
        medicationDetailsLbl.font = UIFont(name: "AraJozoor-Regular", size: 12)
        
        self.contentView.addSubview(medicactionIcon)
        self.contentView.addSubview(mainView)
        mainView.addSubviews(medicactionIcon, medicationLbl, medicationDetailsLbl)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            
            medicactionIcon.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            medicactionIcon.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            medicactionIcon.topAnchor.constraint(equalTo: mainView.topAnchor),
            medicactionIcon.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            
            medicationLbl.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            medicationLbl.leadingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 10),
            medicationLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            
            medicationDetailsLbl.topAnchor.constraint(equalTo: medicationLbl.topAnchor, constant: 20),
            medicationDetailsLbl.leadingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 10),
            medicationDetailsLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            
            
        ])
    }
    
    func configCell(withDataOf category: Category) {
        medicationLbl.text = category.name
        medicactionIcon.image = UIImage(named: category.image)
    }

}
