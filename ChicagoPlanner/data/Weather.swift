//
//  Weather.swift
//  ChicagoPlanner
//
//  Created by Julio on 3/5/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import Foundation
/**
 The Weather model.
 */
public struct Weather: Codable {
    public let coord: Coord
    public let weather: [WeatherElement]
    public let base: String
    public let main: Main
    public let visibility: Int
    public let wind: Wind
    public let snow: Snow
    public let clouds: Clouds
    public let dt: Int
    public let sys: Sys
    public let id: Int
    public let name: String
    public let cod: Int
    
    enum CodingKeys: String, CodingKey {
        case coord = "coord"
        case weather = "weather"
        case base = "base"
        case main = "main"
        case visibility = "visibility"
        case wind = "wind"
        case snow = "snow"
        case clouds = "clouds"
        case dt = "dt"
        case sys = "sys"
        case id = "id"
        case name = "name"
        case cod = "cod"
    }
    
    public init(coord: Coord, weather: [WeatherElement], base: String, main: Main, visibility: Int, wind: Wind, snow: Snow, clouds: Clouds, dt: Int, sys: Sys, id: Int, name: String, cod: Int) {
        self.coord = coord
        self.weather = weather
        self.base = base
        self.main = main
        self.visibility = visibility
        self.wind = wind
        self.snow = snow
        self.clouds = clouds
        self.dt = dt
        self.sys = sys
        self.id = id
        self.name = name
        self.cod = cod
    }
}

public struct Clouds: Codable {
    public let all: Int
    
    enum CodingKeys: String, CodingKey {
        case all = "all"
    }
    
    public init(all: Int) {
        self.all = all
    }
}

public struct Coord: Codable {
    public let lon: Double
    public let lat: Double
    
    enum CodingKeys: String, CodingKey {
        case lon = "lon"
        case lat = "lat"
    }
    
    public init(lon: Double, lat: Double) {
        self.lon = lon
        self.lat = lat
    }
}

public struct Main: Codable {
    public let temp: Double
    public let pressure: Int
    public let humidity: Int
    public let tempMin: Double
    public let tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case pressure = "pressure"
        case humidity = "humidity"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    
    public init(temp: Double, pressure: Int, humidity: Int, tempMin: Double, tempMax: Double) {
        self.temp = temp
        self.pressure = pressure
        self.humidity = humidity
        self.tempMin = tempMin
        self.tempMax = tempMax
    }
}

public struct Snow: Codable {
    public let the1H: Double
    
    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
    
    public init(the1H: Double) {
        self.the1H = the1H
    }
}

public struct Sys: Codable {
    public let type: Int
    public let id: Int
    public let message: Double
    public let country: String
    public let sunrise: Int
    public let sunset: Int
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case message = "message"
        case country = "country"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
    
    public init(type: Int, id: Int, message: Double, country: String, sunrise: Int, sunset: Int) {
        self.type = type
        self.id = id
        self.message = message
        self.country = country
        self.sunrise = sunrise
        self.sunset = sunset
    }
}

public struct WeatherElement: Codable {
    public let id: Int
    public let main: String
    public let description: String
    public let icon: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
    
    public init(id: Int, main: String, description: String, icon: String) {
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
}

public struct Wind: Codable {
    public let speed: Double
    public let deg: Int
    public let gust: Double
    
    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case deg = "deg"
        case gust = "gust"
    }
    
    public init(speed: Double, deg: Int, gust: Double) {
        self.speed = speed
        self.deg = deg
        self.gust = gust
    }
}
