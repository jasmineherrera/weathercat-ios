//
//  TemperatureCollectionViewCell.swift
//  WeatherCat
//
//  Created by Jasmine Herrera on 12/5/19.
//  Copyright © 2019 Jasmine Herrera. All rights reserved.
//

import UIKit

class TemperatureCollectionViewCell: UICollectionViewCell {
    
    var timeLabel: UILabel!
    var tempLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = .systemFont(ofSize: 24)
        timeLabel.textAlignment = .center
        contentView.addSubview(timeLabel)
        
        tempLabel = UILabel()
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.font = .systemFont(ofSize: 24)
        tempLabel.textAlignment = .center
        contentView.addSubview(tempLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        NSLayoutConstraint.activate([
            tempLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            tempLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(for temperature: Temperature) {
        let time = temperature.time
        let temp = temperature.temp
        timeLabel.text = time
        tempLabel.text = temp
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
