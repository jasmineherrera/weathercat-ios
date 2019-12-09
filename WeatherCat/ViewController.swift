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
    var tempCollectionView: UICollectionView!
    var forecastNavigationButton: UIButton!
    var windLabel: UILabel!
    var windValue: UILabel!
    var precipitationLabel: UILabel!
    var precipitationValue: UILabel!
    var locationLabel: UILabel!
    var degreeButton: UILabel!
    
    var catAPI: Cat!
    var forecastAPI: ForecastAPI!
    
    var temps: [Temperature] = []
    let padding: CGFloat = 0
    let tempCellReuseIdentifier = "tempCellReuseIdentifier"
    let headerCellReuseIdentifier = "headerCellReuseIdentifier"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Home"
        
        catImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        catImageView.image = UIImage(named: "Jacket_Cat")
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        catImageView.clipsToBounds = true
        catImageView.contentMode = .scaleAspectFit
        view.addSubview(catImageView)
        
        
        temperatureLabel = UILabel()
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.text = "30°"
        temperatureLabel.font = .boldSystemFont(ofSize: 70)
        view.addSubview(temperatureLabel)
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        
        let one = Temperature(time: "8", temp: "15")
        let two = Temperature(time: "9", temp: "21")
        let three = Temperature(time: "10", temp: "20")
        let four = Temperature(time: "11", temp: "16")
        let five = Temperature(time: "12", temp: "17")
        temps = [one, two, three, four, five]
        
        tempCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        tempCollectionView.backgroundColor = .gray
        tempCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tempCollectionView)
        
        tempCollectionView.register(TemperatureCollectionViewCell.self, forCellWithReuseIdentifier: tempCellReuseIdentifier)
        tempCollectionView.register(LabelView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCellReuseIdentifier)
        tempCollectionView.dataSource = self
        tempCollectionView.delegate = self
        
        
        forecastNavigationButton = UIButton()
        forecastNavigationButton.translatesAutoresizingMaskIntoConstraints = false
        forecastNavigationButton.setTitle("forecast", for: .normal)
        forecastNavigationButton.setTitleColor(.blue, for: .normal)
        forecastNavigationButton.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        
        view.addSubview(forecastNavigationButton)
        
        
        windLabel = UILabel()
        windLabel.translatesAutoresizingMaskIntoConstraints = false
        windLabel.text = "WIND:"
        windLabel.font = .boldSystemFont(ofSize: 20)
        view.addSubview(windLabel)
        
        
        windValue = UILabel()
        windValue.translatesAutoresizingMaskIntoConstraints = false
        windValue.text = "NW 8 mph"
        windValue.font = .systemFont(ofSize: 20)
        view.addSubview(windValue)
        
        
        precipitationLabel = UILabel()
        precipitationLabel.translatesAutoresizingMaskIntoConstraints = false
        precipitationLabel.text = "PRECIPITATION:"
        precipitationLabel.font = .boldSystemFont(ofSize: 20)
        view.addSubview(precipitationLabel)
        
        
        precipitationValue = UILabel()
        precipitationValue.translatesAutoresizingMaskIntoConstraints = false
        precipitationValue.text = "90%"
        precipitationValue.font = .systemFont(ofSize: 20)
        view.addSubview(precipitationValue)
        
        
        locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.text = "Ithaca"
        locationLabel.font = .boldSystemFont(ofSize: 50)
        view.addSubview(locationLabel)
        
        
        degreeButton = UILabel()
        degreeButton.translatesAutoresizingMaskIntoConstraints = false
        degreeButton.text = "F"
        degreeButton.font = .boldSystemFont(ofSize: 40)
        view.addSubview(degreeButton)
        
        setupConstraints()
        getCat()
        getForecast()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            catImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            catImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            catImageView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0.5),
            catImageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0.5)
        ])
        NSLayoutConstraint.activate([
            temperatureLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            temperatureLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40)
        ])
        NSLayoutConstraint.activate([
            tempCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 575),
            tempCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tempCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            tempCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            forecastNavigationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forecastNavigationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ])
        NSLayoutConstraint.activate([
            windLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            windLabel.topAnchor.constraint(equalTo: tempCollectionView.bottomAnchor, constant: 5)
        ])
        NSLayoutConstraint.activate([
            windValue.leadingAnchor.constraint(equalTo: windLabel.trailingAnchor, constant: 5),
            windValue.topAnchor.constraint(equalTo: windLabel.topAnchor)
        ])
        NSLayoutConstraint.activate([
            precipitationValue.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            precipitationValue.topAnchor.constraint(equalTo: windLabel.topAnchor)
        ])
        NSLayoutConstraint.activate([
            precipitationLabel.trailingAnchor.constraint(equalTo: precipitationValue.leadingAnchor, constant: -5),
            precipitationLabel.topAnchor.constraint(equalTo: windLabel.topAnchor)
        ])
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            locationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
        NSLayoutConstraint.activate([
            degreeButton.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 10),
            degreeButton.topAnchor.constraint(equalTo: temperatureLabel.topAnchor, constant: 10)
        ])
    }
    
    func getCat() {
        NetworkManager.getCat(city: "Ithaca") { catAPI in
            self.catAPI = catAPI
            DispatchQueue.main.async {
                self.catImageView.image = UIImage(named: catAPI.cat)
                self.temperatureLabel.text = "\(catAPI.temp)°"
                self.windValue.text = "\(catAPI.wind.dir) \(catAPI.wind.speed) mph"
                self.precipitationValue.text = "\(catAPI.humidity)"
                self.locationLabel.text = "\(catAPI.city!)"
            }
        }
    }
    
    func getForecast() {
        NetworkManager.getForecast(city: "Ithaca") { forecastAPI in
            self.forecastAPI = forecastAPI
            DispatchQueue.main.async {
                var tempsAPI: [Temperature] = []
                for i in forecastAPI.twelveHR_forecast {
                    let element = Temperature(time: String(i.time), temp: String(i.temp))
                    tempsAPI.append(element)
                }
                self.temps = tempsAPI
                self.tempCollectionView.reloadData()
            }
        }
    }
    
    @objc func pushNavViewController() {
        let viewController = ForecastViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return temps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tempCellReuseIdentifier, for: indexPath) as! TemperatureCollectionViewCell
        
        cell.configure(for: temps[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCellReuseIdentifier, for: indexPath) as! LabelView
        return header
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.frame.height - 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 100, height: collectionView.frame.height - 4)
    }
}
