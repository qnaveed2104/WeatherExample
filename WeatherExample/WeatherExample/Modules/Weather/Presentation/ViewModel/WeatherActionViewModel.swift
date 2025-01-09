//
//  WeatherActionViewModel.swift
//  WeatherExample
//
//  Created by Qazi on 08/01/2025.
//
import SwiftUI
import WeatherConnect
protocol WeatherActionViewModelProtocol: ObservableObject {
    var interactor: WeatherInteractorProtocol { get }
    var isLoading: Bool { get set }
    var isWeatherViewPresented: Bool { get set }
    var cityName: String { get set }
    var errorMessage: IdentifiableError? { get set }
    func forecastButtonTapped()
}

class WeatherActionViewModel: WeatherActionViewModelProtocol {
    var interactor: WeatherInteractorProtocol
    @Published var isLoading: Bool = false
    @Published var isWeatherViewPresented: Bool = false
    @Published var cityName: String = ""
    @Published var errorMessage: IdentifiableError?


    var weatherView: AnyView?
    
    init(interactor: WeatherInteractorProtocol = WeatherInteractor()) {
        self.interactor = interactor
    }
    
    @MainActor
    func forecastButtonTapped() {
        Task {
            do {
                let view = try await interactor.fetchWeatherView(cityName: cityName)
                cityName = ""
                self.weatherView = view
                self.isLoading = false
                self.isWeatherViewPresented = true
            } catch {
                handle(error: error)
            }
            isLoading = false
        }
    }
    
    private func handle(error: Error) {
        let message = AppError.getLocalizedErrorMessage(error: error)
        print("Error fetching weather view: \(message)")
        DispatchQueue.main.async {
            self.errorMessage = IdentifiableError(message: message)
            self.isLoading = false
        }
    }
    
}

