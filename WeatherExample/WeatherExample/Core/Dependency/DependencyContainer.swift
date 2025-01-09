//
//  DependencyContainer.swift
//  WeatherExample
//
//  Created by Qazi on 09/01/2025.
//

struct DependencyContainer {
    static func makeWeatherInputView() -> WeatherActionView {
        let sdkProvider = SDKProvider(apiKey: AppConstants.API.apiKey)
        let repository = WeatherRepository(sdkProvider: sdkProvider)
        let interactor = WeatherInteractor(repository: repository)
        let viewModel = WeatherActionViewModel(interactor: interactor)
        return WeatherActionView(viewModel: viewModel)
    }
}
