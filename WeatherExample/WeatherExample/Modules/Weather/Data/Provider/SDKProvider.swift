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
        self.weatherSDK = weatherSDK
    }

    // MARK: - SDK Provider
    func provideSDK() -> WeatherSDK? {
        return nil
    }

    // MARK: - WeatherSDKDelegate
    func onFinished() {
        print("onFinished")
    }
    
    func onFinishedWithError(_ error: any Error) {
        print("onFinishedWithError")
    }
}
