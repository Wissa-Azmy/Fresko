//
//  ProductCell.swift
//  Green-K
//
//  Created by Wissa Azmy on 11/17/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    
    let mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = false // this will make sure its children do not go out of the boundary
        return view
    }()

    let awarenessImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Fresh-Meal")
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.clipsToBounds = true
        return img
    }()
    
    let dateView: UIView = {
        let view = UIView()
        view.alpha = 0.5
        view.backgroundColor = #colorLiteral(red: 0.08914274722, green: 0.1213926896, blue: 0.2849592865, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        
        label.textColor =  #colorLiteral(red: 0.9431121945, green: 0.685233891, blue: 0.08307827264, alpha: 1)
        label.text = "Expires: Nov 20"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        
        label.textColor =  #colorLiteral(red: 0.08914274722, green: 0.1213926896, blue: 0.2849592865, alpha: 1)
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.text = "  Fresh Meal\n  Amount: 5\n  Price: 7 €"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
        
        mainView.addSubview(awarenessImageView)
        dateView.addSubview(dateLabel)
        mainView.addSubview(dateView)
        mainView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            mainView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            mainView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            mainView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
           
            awarenessImageView.topAnchor.constraint(equalTo: mainView.topAnchor),
            awarenessImageView.widthAnchor.constraint(equalTo: mainView.widthAnchor),
            awarenessImageView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.6),
            
            dateView.bottomAnchor.constraint(equalTo: awarenessImageView.bottomAnchor),
            dateView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            dateView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            dateView.heightAnchor.constraint(equalToConstant: 30),
            
            dateLabel.centerYAnchor.constraint(equalTo: dateView.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: dateView.leadingAnchor, constant: 20),
            
            titleLabel.topAnchor.constraint(equalTo: awarenessImageView.bottomAnchor,constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10 )
            
        ])
        
    }

}
