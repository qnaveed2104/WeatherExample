//
//  WeatherActionView.swift
//  WeatherExample
//
//  Created by Qazi on 08/01/2025.
//

import SwiftUI

struct WeatherActionView: View {
    @ObservedObject var viewModel: WeatherActionViewModel
    @State private var cityName: String = ""
    @FocusState private var isFocused: Bool
    
    // Constants
    private let verticalSpacing: CGFloat = 24
    private let subViewHeight: CGFloat = 56
    private let textFieldPadding: CGFloat = 16
    private let cornerRadius: CGFloat = 16
    private let buttonPadding: CGFloat = 12
    private let horizontalPadding: CGFloat = 24
    private let topPadding: CGFloat = 32
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: verticalSpacing) {
                // Title Text
                titleView()
                
                // City Input TextField
                cityInputField()
                
                // Weather Forecast Button
                forecastButton()
                
                Spacer()
            }
            .padding(.horizontal, horizontalPadding)
            .padding(.top, topPadding)
            .background(AppColors.primaryBackground.color)
            .toolbarBackground(AppColors.navBarColor.color, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitle(AppConstants.DisplayMessages.header, displayMode: .inline)
            .navigationDestination(isPresented: $viewModel.isWeatherViewPresented) {
                if let weatherView = viewModel.weatherView {
                    weatherView
                }
            }
        }
    }
    
    // MARK: - Subviews
    
    /// Title View
    private func titleView() -> some View {
        ExampleViewWithTheme(AppConstants.DisplayMessages.forecastText, style: .heading2)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    /// City Input Field
    private func cityInputField() -> some View {
        TextField(AppConstants.DisplayMessages.enterCityText, text: $viewModel.cityName)
            .padding(.horizontal, textFieldPadding)
            .frame(height: subViewHeight)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(isFocused ? AppColors.accent.color : AppColors.textBorder.color, lineWidth: 1)
            )
            .focused($isFocused)
            .font(ThemeFonts.textRegular())
            .opacity(isFocused ? 1 : 0.8)
            .foregroundColor(AppColors.textPrimary.color)
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
            .keyboardType(.default)
    }
    
    /// Weather Forecast Button
    private func forecastButton() -> some View {
        Button(action: fetchWeatherForecast) {
            Text(AppConstants.DisplayMessages.forecastButtonTitle)
                .font(ThemeFonts.title())
                .foregroundColor(.white)
                .padding(.vertical, buttonPadding)
                .frame(maxWidth: .infinity)
                .frame(height: subViewHeight)
                .background(Capsule().fill(AppColors.accent.color))
        }
    }
    
    // MARK: - Actions
    private func fetchWeatherForecast() {
        print("Fetching weather forecast for \(cityName)")
        viewModel.forecastButtonTapped()
    }
}

#Preview {
    WeatherActionView(viewModel: WeatherActionViewModel())
}
