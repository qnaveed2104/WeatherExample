//
//  WeatherInteractor.swift
//  WeatherExample
//
//  Created by Qazi on 08/01/2025.
//
import SwiftUI

protocol WeatherInteractorProtocol {
    var repository: WeatherRepositoryProtocol { get }
    func fetchWeatherView(cityName: String) async throws -> AnyView
}

struct WeatherInteractor: WeatherInteractorProtocol {
    let repository: WeatherRepositoryProtocol
    
    init(repository: WeatherRepositoryProtocol = WeatherRepository()) {
        self.repository = repository
    }
    
    func fetchWeatherView(cityName: String) async throws -> AnyView {
        return try await repository.getWeatherView(for: cityName)
    }
}
