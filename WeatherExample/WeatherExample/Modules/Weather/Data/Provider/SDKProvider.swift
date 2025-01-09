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
        let configuration = Configurations(apiKey: apiKey, cityName: "")
        self.weatherSDK = try? WeatherSDK(configuration: configuration, delegate: self)
    }

    // MARK: - SDK Provider
    func provideSDK() -> WeatherSDK? {
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
