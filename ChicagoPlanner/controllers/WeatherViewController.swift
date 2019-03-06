//
//  WeatherViewController.swift
//  ChicagoPlanner
//
//  Created by Julio on 3/5/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    
    
    
    
    var humidity: Int = 0
    var pressure: Int = 0
    var windSpeed: Double = 0.0
    var currentWeather: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getChicagoWeather()
        // Do any additional setup after loading the view.
    }
    
    /**
     Makes a HTTP request to the endpoint: https://api.openweathermap.org/data/2.5/weather?q=chicago&APPID=0ecc43f46e0c3894a92312a6f3043377
     to obtain the current weather in Chicago.
     */
    func getChicagoWeather() -> Void {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        let url:URL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=chicago&APPID=0ecc43f46e0c3894a92312a6f3043377")!
        
        let task = session.dataTask(with: url){
            (data, response, error) in
            // verify if there is any HTTP errors.
            guard error == nil else {
                print("Error getting Chicago weather.")
                return
            }
            // verify if we actually get data
            guard let weatherData = data else {
                print("Weather data is empty")
                return
            }
            do {
                
                let weather = try? JSONDecoder().decode(Weather.self, from: weatherData)
                if let weatherElement = weather {
                    self.pressure = weatherElement.main.pressure
                    self.humidity = weatherElement.main.humidity
                    self.windSpeed = weatherElement.wind.speed
                    for weather in weatherElement.weather {
                        self.currentWeather = weather.description
                    }
                }
                
            }
            
        }
        // execute http request.
        task.resume()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.getChicagoWeather()
        self.weatherLabel.text = self.currentWeather
        self.humidityLabel.text = String(self.humidity) + "%"
        self.pressureLabel.text = String(self.pressure)
        self.windLabel.text = String(self.windSpeed) + "km/h"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
