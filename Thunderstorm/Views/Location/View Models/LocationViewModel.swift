//
//  LocationViewModel.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import Foundation

struct LocationViewModel {
    let location: Location

    var forecastViewModel: ForecastViewModel {
        ForecastViewModel()
    }

    var currentConditionsViewModel: CurrentConditionsViewModel {
        CurrentConditionsViewModel()
    }
}
