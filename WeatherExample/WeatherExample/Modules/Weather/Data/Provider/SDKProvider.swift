//
//  SDKProvider.swift
//  WeatherExample
//
//  Created by Qazi on 09/01/2025.
//

import WeatherConnect

protocol SDKProviderProtocol {
    func initializeSDK(withCityName: String) -> WeatherSDK?
}

class SDKProvider: SDKProviderProtocol, WeatherSDKDelegate {
    private let apiKey: String
    private var weatherSDK: WeatherSDK?
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func initializeSDK(withCityName: String) -> WeatherSDK? {
        let configuration = Configurations(apiKey: apiKey, cityName: withCityName)
        do {
            self.weatherSDK = try WeatherSDK(configuration: configuration, delegate: self)
            return provideSDK()
        } catch {
            print("Failed to initialize WeatherSDK: \(error.localizedDescription)")
            self.weatherSDK = nil
            return nil
        }
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
        print("onFinishedWithError")
    }
}
