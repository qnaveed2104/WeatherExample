//
//  WeatherRepositories.swift
//  WeatherExample
//
//  Created by Qazi on 09/01/2025.
//
import SwiftUI

protocol WeatherRepositoryProtocol {
    var sdkProvider: SDKProviderProtocol { get }
    func getWeatherView(for cityName: String) async throws -> AnyView
}

struct WeatherRepository: WeatherRepositoryProtocol {
    let sdkProvider: SDKProviderProtocol
    
    init(sdkProvider: SDKProviderProtocol = SDKProvider(apiKey: AppConstants.API.apiKey)) {
        self.sdkProvider = sdkProvider
    }
    
    @MainActor func getWeatherView(for cityName: String) async throws -> AnyView {
        guard let weatherSDK = sdkProvider.provideSDK() else {
            throw NSError(domain: "", code: 111)
        }
        return await weatherSDK.getWeather()
    }
}
