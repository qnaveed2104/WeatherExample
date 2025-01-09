//
//  SDKProvider.swift
//  WeatherExample
//
//  Created by Qazi on 09/01/2025.
//

import WeatherConnect

protocol SDKProviderProtocol {
    func provideSDK() -> WeatherSDK?
}

class SDKProvider: SDKProviderProtocol, WeatherSDKDelegate {
    private let apiKey: String
    private var weatherSDK: WeatherSDK?
    
    init(apiKey: String, weatherSDK: WeatherSDK? = nil) {
        self.apiKey = apiKey
        initializeSDK()
    }
    
    private func initializeSDK() {
        //        let configuration = Configurations(apiKey: apiKey, cityName: "")
        //        self.weatherSDK = try? WeatherSDK(configuration: configuration, delegate: self)
        let configuration = Configurations(apiKey: apiKey, cityName: "Berlin")
        do {
            self.weatherSDK = try WeatherSDK(configuration: configuration, delegate: self)
            print("WeatherSDK successfully initialized")
        } catch {
            print("Failed to initialize WeatherSDK: \(error.localizedDescription)")
            self.weatherSDK = nil
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
