# Weather App

A Flutter weather application built using Clean Architecture principles.

## Features

- Display current weather for any city
- Support for English and Arabic languages
- Offline error handling
- Clean Architecture implementation

## Architecture

This project follows Clean Architecture principles and is organized into three main layers:

- **Data Layer**: Implements the repository interfaces and contains the data sources
- **Domain Layer**: Contains the business logic and entities
- **Presentation Layer**: Contains the UI and state management (BLoC)

## Dependencies

- flutter_bloc: State management
- dio: HTTP client
- get_it: Dependency injection
- go_router: Navigation
- easy_localization: Internationalization
- flutter_dotenv: Environment variables management


