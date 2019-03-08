//
//  WeatherViewController.swift
//  ChicagoPlanner
//
//  Created by Julio on 3/5/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

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
        let url: String = "https://api.openweathermap.org/data/2.5/weather?q=chicago&APPID=0ecc43f46e0c3894a92312a6f3043377"
        AF.request(url).responseJSON {
            response in
            guard response.result.error == nil else {
                print("Error with url.")
                return
            }
            guard let JSONResponse = response.result.value as? [String: Any] else {
                print("Did not get JSON response")
                return
            }
            let swiftifyJSON = JSON(JSONResponse)
            self.windSpeed = swiftifyJSON["wind"]["speed"].doubleValue
            self.pressure = swiftifyJSON["main"]["pressure"].intValue
            self.currentWeather = swiftifyJSON["weather"][0]["description"].stringValue
            self.humidity = swiftifyJSON["main"]["humidity"].intValue
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
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
