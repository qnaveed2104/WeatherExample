# Weather App with Clean Architecture

Welcome to the Weather App, a SwiftUI-based application designed to provide weather forecasts using the WeatherConnect SDK. This app is built using the principles of Clean Architecture for maintainable, testable, and scalable code.

## Features

- **City-Based Weather Forecast**: Enter a city name to fetch real-time weather forecasts.
- **SwiftUI Navigation**: Smooth transitions between the input screen and the weather details screen.
- **Clean Architecture Design**: Separation of concerns across layers (Presentation, Domain, Data).
- **Asynchronous Operations**: Leverages Swift's structured concurrency for seamless data fetching.

## Clean Architecture Overview

The app follows the Clean Architecture pattern, which ensures:

- **Separation of Concerns**: Each layer has a specific responsibility.
- **Testability**: Clear boundaries allow for easy testing of each layer.
- **Scalability**: The architecture is adaptable to new features and requirements.

## Layers

### Presentation Layer

- **WeatherInputView** (SwiftUI View)
- **WeatherInputViewModel** (ObservableObject ViewModel)

### Domain Layer

- **WeatherUseCase** (Protocol)
- **WeatherInteractor** (Implementation)

### Data Layer

- **WeatherRepository** (Protocol)
- **WeatherRepositoryImpl** (Implementation)
- **WeatherSDKProvider** (Protocol)
- **DefaultWeatherSDKProvider** (Implementation)

## Installation

### Prerequisites

- Xcode 15 or later
- iOS 17.0 or later
- Swift Package Manager (SPM)

### Steps

1. Clone this repository:
   ```bash
   git clone https://github.com//.git
