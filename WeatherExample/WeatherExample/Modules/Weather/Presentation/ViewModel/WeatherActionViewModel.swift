//
//  WeatherActionViewModel.swift
//  WeatherExample
//
//  Created by Qazi on 08/01/2025.
//
import SwiftUI

protocol WeatherActionViewModelProtocol: ObservableObject {
    var interactor: WeatherInteractorProtocol { get }
}

class WeatherActionViewModel: WeatherActionViewModelProtocol {
    var interactor: WeatherInteractorProtocol
    
    init(interactor: WeatherInteractorProtocol = WeatherInteractor()) {
        self.interactor = interactor
    }
    
    
}
