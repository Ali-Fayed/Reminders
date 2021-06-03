//
//  WeatherServices.swift
//  Reminders
//
//  Created by fixed on 03/06/2021.
//

import Foundation
import Combine

class WeatherService {
    func fetchWeather () -> AnyPublisher<WeatherData, Never> {
        let urlString = "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=8d9cc011d829eb206b9e069cb02400b4"
        let publisher = URLSession.shared.dataTaskPublisher(for: URL(string: urlString)!)
            .map({$0.data})
            .decode(type: WeatherData.self, decoder: JSONDecoder())
            .catch ({ _ in
                try! Just(WeatherData(from: JSONDecoder() as! Decoder))
            }).eraseToAnyPublisher()
        return publisher
    }
}
