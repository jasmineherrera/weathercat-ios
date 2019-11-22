//
//  ForecastViewController.swift
//  WeatherCat
//
//  Created by Jasmine Herrera on 11/22/19.
//  Copyright © 2019 Jasmine Herrera. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {
    var tableView: UITableView!
    
    let reuseIdentifier = "locationCellReuse"
    let cellHeight: CGFloat = 150
    var locations: [Location]!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Locations"
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let sandiego = Location(temperature: "70°F", place: "San Diego", condition: .sunny)
        let newyork = Location(temperature: "46°F", place: "New York", condition: .sunny)
        let minnesota = Location(temperature: "34°F", place: "Minnesota", condition: .sunny)
        let colorado = Location(temperature: "28°F", place: "Colorado", condition: .cloudy)
        locations = [sandiego, newyork, minnesota, colorado]
        
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(LocationsTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ForecastViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! LocationsTableViewCell
        let location = locations[indexPath.row]
        cell.configure(for: location)
        cell.selectionStyle = .none
        return cell
    }
}

extension ForecastViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
