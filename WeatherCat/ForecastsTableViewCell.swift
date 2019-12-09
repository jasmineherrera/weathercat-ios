//
//  ForecastsTableViewCell.swift
//  WeatherCat
//
//  Created by Jasmine Herrera on 12/5/19.
//  Copyright © 2019 Jasmine Herrera. All rights reserved.
//

import UIKit

class ForecastsTableViewCell: UITableViewCell {
    
    var dateLabel: UILabel!
    var tempLabel: UILabel!
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        dateLabel = UILabel()
        dateLabel.font = UIFont.boldSystemFont(ofSize: 35)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)
        
        tempLabel = UILabel()
        tempLabel.font = .systemFont(ofSize: 50)
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tempLabel)
        
        setupConstraints()
        
        
    }
    func setupConstraints() {
        NSLayoutConstraint.activate(([
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8)
        ]))
        NSLayoutConstraint.activate(([
            tempLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tempLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor)
        ]))
    }
    
    func configure(for forecast: Forecast){
        dateLabel.text = forecast.day
        tempLabel.text = "\(forecast.lowTemperature)° - \(forecast.highTemperature)°"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
