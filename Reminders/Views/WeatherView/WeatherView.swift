//
//  WeatherView.swift
//  Reminders
//
//  Created by fixed on 02/06/2021.
//

import SwiftUI

struct WeatherView: View {

    @StateObject var viewModel = WeatherViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Text(viewModel.title).font(.system(size: 32))
                    .font(.largeTitle)
                    .padding()
                Text(String("\(viewModel.temp) K")).font(.system(size: 24))
                    .font(.system(size: 70))
                    .bold()
                Text("🌧").font(.system(size: 15))
                    .font(.largeTitle)
                    .padding()
                Text("time zone is \(String(viewModel.timezone))").font(.system(size: 24))
            }.navigationTitle("Weather")
        }
    }
}
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 11")
    }
}
