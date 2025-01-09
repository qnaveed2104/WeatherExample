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
   [git clone https://github.com//.git](https://github.com/qnaveed2104/WeatherExample.git)


## Usage

### Weather Input Screen
- Enter a city name in the text field.
- Tap the "Weather Forecast" button to fetch the weather.

### Weather Details Screen
- View detailed weather information for the entered city.

## Code Structure

### Presentation Layer
- **WeatherInputView**: The main SwiftUI view that handles user input.
- **WeatherInputViewModel**: Connects the UI with the domain layer, managing the state and interactions.

### Domain Layer
- **WeatherUseCase**: A protocol defining the business logic for fetching weather data.
- **WeatherInteractor**: Implements the WeatherUseCase, interacting with the data layer.

### Data Layer
- **WeatherRepository**: Protocol for data operations.
- **WeatherRepositoryImpl**: Implements the repository, interfacing with the WeatherSDKProvider.
- **WeatherSDKProvider**: Abstracts the initialization and provision of the Weather SDK.

## Error Handling

The app includes robust error handling for:

- **SDK Initialization Failures**: Ensures fallback mechanisms if the Weather SDK fails to initialize.
- **Network Errors**: Handles connectivity issues gracefully.

### Example Errors
- **WeatherError.sdkInitializationFailed**: Displayed when the Weather SDK fails to initialize.

## Dependencies

This project uses the WeatherConnect SDK for fetching weather data.

- **Repository**: WeatherConnect

## Contributing

We welcome contributions to improve this project. Feel free to fork the repository and submit pull requests. Ensure your code follows the Clean Architecture principles and includes relevant tests.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Contact

For questions, feedback, or support, contact:

- **Qazi Naveed**
- **GitHub**: [@qnaveed2104](https://github.com/qnaveed2104)

Thank you for exploring the Weather App! We hope this project serves as a helpful reference for building scalable and maintainable SwiftUI applications with Clean Architecture.

   
