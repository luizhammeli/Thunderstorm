//
//  ForecastViewModel.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 03/12/23.
//

import Foundation

struct ForecastViewModel {
    private let conditions: [WeatherData.DayConditions]

    var cellViewModels: [ForecastCellViewModel] {
        conditions.map {
            ForecastCellViewModel(dayCondition: $0)
        }
    }

    // MARK: Init
    
    init(conditions: [WeatherData.DayConditions]) {
        self.conditions = conditions
    }
}
