//
//  LocationsTableViewCell.swift
//  WeatherCat
//
//  Created by Jasmine Herrera on 11/22/19.
//  Copyright © 2019 Jasmine Herrera. All rights reserved.
//

import UIKit

class LocationsTableViewCell: UITableViewCell {
    
    var nameLabel: UILabel!
    var conditionsLabel: UILabel!
    var tempLabel: UILabel!
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        conditionsLabel = UILabel()
        conditionsLabel.font = UIFont.systemFont(ofSize: 12)
        conditionsLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(conditionsLabel)
        
        tempLabel = UILabel()
        tempLabel.font = UIFont.systemFont(ofSize: 12)
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tempLabel)
        
        setupConstraints()
        
        
    }
    func setupConstraints() {
        NSLayoutConstraint.activate(([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.heightAnchor.constraint(equalToConstant: 16),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8)
        ]))
        NSLayoutConstraint.activate(([
            conditionsLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            conditionsLabel.heightAnchor.constraint(equalToConstant: 16),
            conditionsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor)
        ]))
        NSLayoutConstraint.activate(([
            tempLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tempLabel.heightAnchor.constraint(equalToConstant: 16),
            tempLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor)
        ]))
    }
    
    func configure(for location: Location){
        nameLabel.text = location.place
        conditionsLabel.text = "Condition: \(location.getConditionString())"
        tempLabel.text = location.temperature
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
