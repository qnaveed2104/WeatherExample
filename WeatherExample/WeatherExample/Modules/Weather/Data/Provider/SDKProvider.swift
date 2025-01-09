//
//  SDKProvider.swift
//  WeatherExample
//
//  Created by Qazi on 09/01/2025.
//

import WeatherConnect

protocol SDKProviderProtocol {
    func initializeSDK(withCityName: String) throws -> WeatherSDK?
}

class SDKProvider: SDKProviderProtocol, WeatherSDKDelegate {
    private let apiKey: String
    private var weatherSDK: WeatherSDK?
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func initializeSDK(withCityName: String) throws -> WeatherSDK? {
        let configuration = Configurations(apiKey: apiKey, cityName: withCityName)
        self.weatherSDK = try WeatherSDK(configuration: configuration, delegate: self)
        return provideSDK()
    }
    
    // MARK: - SDK Provider
    func provideSDK() -> WeatherSDK? {
        guard let weatherSDK else {
            print("WeatherSDK is not initialized. Please check the initialization process.")
            return nil
        }
        return weatherSDK
    }
    
    // MARK: - WeatherSDKDelegate
    func onFinished() {
        print("onFinished")
    }
    
    func onFinishedWithError(_ error: any Error) {
        let message = AppError.getLocalizedErrorMessage(error: error)
        print("Error on dissmissing weather view: \(message)")
    }
}
