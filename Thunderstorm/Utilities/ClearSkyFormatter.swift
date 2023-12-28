//
//  ClearSkyFormatter.swift
//  Thunderstorm
//
//  Created by Luiz Diniz Hammerli on 28/12/23.
//

import Foundation

struct ClearSkyFormatter {
    private let measurementFormatter = MeasurementFormatter()
    
    init(locale: Locale = .current) {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesSignificantDigits = false
        numberFormatter.locale = locale

        measurementFormatter.numberFormatter = numberFormatter
        measurementFormatter.locale = locale
    }

    func formatWindSpeed(_ windSpeed: Float) -> String {
        let measurement = Measurement(value: Double(windSpeed), unit: UnitSpeed.milesPerHour)
        return measurementFormatter.string(from: measurement)
    }

    func formatTemperature(_ temperature: Float) -> String {
        let measurement = Measurement(value: Double(temperature), unit: UnitTemperature.fahrenheit)
        return measurementFormatter.string(from: measurement)
    }
}
