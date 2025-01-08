//
//  WeatherActionViewModel.swift
//  WeatherExample
//
//  Created by Qazi on 08/01/2025.
//
import SwiftUI

protocol WeatherActionViewModelProtocol: ObservableObject {
    var interactor: WeatherInteractorProtocol { get }
    var isLoading: Bool { get set }
    func forecastButtonTapped()
}

class WeatherActionViewModel: WeatherActionViewModelProtocol {
    var interactor: WeatherInteractorProtocol
    var isLoading: Bool = false
    
    init(interactor: WeatherInteractorProtocol = WeatherInteractor()) {
        self.interactor = interactor
    }
    
    func forecastButtonTapped() {
        Task {
            do {
                
                let view = try await interactor.fetchWeatherView(cityName: "cityName")
            } catch {
                print(error)
            }
            
            isLoading = false
        }
    }
    
}
