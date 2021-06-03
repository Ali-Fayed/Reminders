//
//  WeatherModel.swift
//  Reminders
//
//  Created by fixed on 02/06/2021.
//

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    let timezone: Int
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String?
    let id: Int
}
