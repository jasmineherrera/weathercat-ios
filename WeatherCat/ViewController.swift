//
//  ViewController.swift
//  WeatherCat
//
//  Created by Jasmine Herrera on 11/22/19.
//  Copyright © 2019 Jasmine Herrera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var temperatureLabel: UILabel!
    var catImageView: UIImageView!
    var locationsNavigationButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Current Locations"
        
        temperatureLabel = UILabel()
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.text = "67°F"
        temperatureLabel.font = .boldSystemFont(ofSize: 150)
        view.addSubview(temperatureLabel)
        
        catImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        catImageView.image = UIImage(named: "kitty")
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        catImageView.clipsToBounds = true
        catImageView.contentMode = .scaleAspectFit
        view.addSubview(catImageView)
        
        locationsNavigationButton = UIButton()
        locationsNavigationButton.translatesAutoresizingMaskIntoConstraints = false
        locationsNavigationButton.setTitle("other locations", for: .normal)
        locationsNavigationButton.setTitleColor(.black, for: .normal)
        locationsNavigationButton.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        view.addSubview(locationsNavigationButton)
        
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            catImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            catImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperatureLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40)
        ])
        NSLayoutConstraint.activate([
            locationsNavigationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            locationsNavigationButton.topAnchor.constraint(equalTo: catImageView.bottomAnchor, constant: 100)
        ])
    }
    
    @objc func pushNavViewController() {
        let viewController = ForecastViewController()
        navigationController?.pushViewController(viewController, animated: true)
        
    }

}

