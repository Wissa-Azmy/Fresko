//
//  CartItemCell.swift
//  Green-K
//
//  Created by Wissa Azmy on 11/17/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import UIKit
import UIReactor

class CartItemCell: UITableViewCell {

    let medicationNameLbl = UIReactor.fuseLabel()
    let medicationDetailsLbl = UIReactor.fuseLabel(txtColor: .gray)
    let medicactionIcon: UIImageView = UIReactor.fuseImageView(withImageNamed: "medicationIconBlue")
    
    let mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = false // this will make sure its children do not go out of the boundary
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        contentView.addSubview(mainView)
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        layer.shadowOpacity = 0.08
        layer.shadowRadius = 20
        layer.shadowColor = UIColor.black.cgColor
        
        // add corner radius on `contentView`
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        
        medicationNameLbl.font = UIFont(name: "AraJozoor-Regular", size: 12)
        medicationNameLbl.numberOfLines = 1
        medicationDetailsLbl.font = UIFont(name: "AraJozoor-Regular", size: 12)
        
        mainView.addSubViews(medicactionIcon, medicationNameLbl, medicationDetailsLbl)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            medicactionIcon.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            medicactionIcon.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            medicactionIcon.heightAnchor.constraint(equalToConstant: 50),
            medicactionIcon.widthAnchor.constraint(equalToConstant: 50),
            
            medicationNameLbl.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            medicationNameLbl.leadingAnchor.constraint(equalTo: medicactionIcon.trailingAnchor, constant: 10),
            medicationNameLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            
            medicationDetailsLbl.topAnchor.constraint(equalTo: medicationNameLbl.topAnchor, constant: 20),
            medicationDetailsLbl.leadingAnchor.constraint(equalTo: medicactionIcon.trailingAnchor, constant: 10),
            medicationDetailsLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
        ])
    }
    
    func configCell(withDataOf medication: Candy) {
        medicationNameLbl.text = medication.name
        medicationDetailsLbl.text = medication.name
    }

}
