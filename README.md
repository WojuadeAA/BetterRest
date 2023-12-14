
# BetterRest

BetterRest is an iOS app designed to assist coffee drinkers in achieving a better night's sleep by analyzing their sleep preferences. By answering three key questions—wake-up time, desired sleep duration, and daily coffee intake—the app provides personalized sleep recommendations using machine learning powered by CoreML APIs.

## Overview

This project focuses on gathering user input via a date picker, stepper, and picker to determine their preferred wake-up time, sleep duration, and caffeine consumption. Leveraging the CoreML APIs, BetterRest employs a machine learning model to predict optimal sleep patterns based on user input.

## Features

- **Wake-up Time Selection**: Allows users to choose their desired wake-up time using a date picker.
- **Sleep Duration Preference**: Determines the ideal duration of sleep users aim for through a stepper view.
- **Coffee Intake Input**: Asks users about their daily coffee consumption using a picker.

## Technologies and Learnings

- **Swift's Date API**: Utilized for handling date and time in the app's user interface.
- **Machine Learning with CoreML**: Created a custom machine learning model using CreateML and implemented it in the app using CoreML APIs.
- **Stepper View**: Introduced the use of a stepper view to navigate and select through a range of values.
- **Picker**: Employed a picker to facilitate the selection of options for coffee intake.

## Screenshots

![Screenshot 1](images/image1.png)
![Screenshot 2](images/image2.png)
![Screenshot 3](images/image3.png)

## Getting Started

To explore and run the BetterRest app:
1. Clone this repository.
2. Open the project in Xcode.
3. Build and run the app on a simulator or a physical device.
4. Input your preferred wake-up time, sleep duration, and daily coffee intake to receive personalized sleep recommendations.

## Acknowledgments

This project was created as a learning exercise inspired by [Hacking with Swift's 100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui). The implementation was guided by resources from the Swift community, Apple's documentation, and tutorials on CoreML and SwiftUI integration.
