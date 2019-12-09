//
//  LabelView.swift
//  WeatherCat
//
//  Created by Jasmine Herrera on 12/5/19.
//  Copyright © 2019 Jasmine Herrera. All rights reserved.
//

import UIKit

class LabelView: UICollectionReusableView {
    
    var timeLabel: UILabel!
    var tempLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        timeLabel = UILabel()
        timeLabel.text = "TIME"
        timeLabel.textAlignment = .center
        timeLabel.font = .systemFont(ofSize: 24)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(timeLabel)
        
        tempLabel = UILabel()
        tempLabel.text = "TEMP"
        tempLabel.textAlignment = .center
        tempLabel.font = .systemFont(ofSize: 24)
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tempLabel)
        
        setupConstraints()
        
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timeLabel.topAnchor.constraint(equalTo: topAnchor)
        ])
        NSLayoutConstraint.activate([
            tempLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            tempLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
