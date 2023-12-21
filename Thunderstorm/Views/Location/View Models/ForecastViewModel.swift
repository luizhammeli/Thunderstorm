//
//  ForecastViewModel.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import Foundation

struct ForecastViewModel {
    var cellViewModels: [ForecastCellViewModel] {        
        (0...10).map { day in
            let increment = TimeInterval(day) * 24.0 * 3600.0
            let forecastDate = Date().addingTimeInterval(increment)

            return ForecastCellViewModel(forecastDate: forecastDate)
        }
    }
}
