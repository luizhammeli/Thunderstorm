//
//  LocationViewModel.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import Foundation

struct LocationViewModel {
    let location: Location
    let weatherData: WeatherData?

    var forecastViewModel: ForecastViewModel {
        ForecastViewModel()
    }

    var currentConditionsViewModel: CurrentConditionsViewModel {
        CurrentConditionsViewModel(currentConditions: weatherData?.currently)
    }
}
