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
    
    let reuseIdentifier = "forecastCellReuseIdentifier"
    let cellHeight: CGFloat = 150
    var forecasts: [Forecast]!
    var forecastAPI: ForecastAPI!
    let dayLabels: [String] = ["Tomorrow", "2 Days from Today", "3 Days from Today"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Current Location"
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let thursday = Forecast(highTemperature: "45", lowTemperature: "27", day: dayLabels[0])
        let friday = Forecast(highTemperature: "32", lowTemperature: "17", day: dayLabels[1])
        let saturday = Forecast(highTemperature: "46", lowTemperature: "24", day: dayLabels[2])
        forecasts = [thursday, friday, saturday]
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ForecastsTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
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
    
    func getForecast() {
        NetworkManager.getForecast(city: "Ithaca") { forecastAPI in
            self.forecastAPI = forecastAPI
            DispatchQueue.main.async {
                var forecastsAPI: [Forecast] = []
                for i in 0...2 {
                    let element = Forecast(highTemperature: String(forecastAPI.high_temps[i]), lowTemperature: String(forecastAPI.low_temps[i]), day: self.dayLabels[i])
                    forecastsAPI.append(element)
                }
                self.forecasts = forecastsAPI
                self.tableView.reloadData()
            }
        }
        
    }
}





extension ForecastViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ForecastsTableViewCell
        let forecast = forecasts[indexPath.row]
        cell.configure(for: forecast)
        cell.selectionStyle = .none
        return cell
    }
}

extension ForecastViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
