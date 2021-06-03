//
//  WeatherViewModel.swift
//  Reminders
//
//  Created by fixed on 02/06/2021.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {

    @Published var title: String = ""
    @Published var temp: Double = 0.0
    @Published var timezone: Int = 0
    var observer :AnyCancellable?

    init() {
        observer = WeatherService().fetchWeather().receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] name in
                self?.title = name.name
                self?.timezone = name.timezone
                self?.temp = name.main.temp
            })
    }
}
