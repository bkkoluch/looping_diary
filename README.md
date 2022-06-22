# Looping Diary

## Project basic info

The main idea of the project is to let users fill in their daily journal entries and see their
entries from previous years on the same day, letting them contemplate and see how they changed
throughout the years.

Project is created using Clean Architecture.

## Basic project presentation

| - | - | - | - |
|---|---|---|---|
|![screenshot1](https://user-images.githubusercontent.com/58911502/174785428-f1e193b2-9ac0-4a05-bc85-4e07aa997249.jpeg)|![screenshot2](https://user-images.githubusercontent.com/58911502/174785532-0ba2e0da-d073-4d7a-8369-e3bf7cfae228.jpeg)|![screenshot3](https://user-images.githubusercontent.com/58911502/174785563-df4b7e0d-3573-485c-ad16-6d5be47dea53.jpeg)|![screenshot4](https://user-images.githubusercontent.com/58911502/174785587-ed7454eb-e425-4cdc-b234-226564c10d49.jpeg)|

## Technology stack & main project dependencies

- Flutter - version 3.0.1

| Type  | Used dependency |
|---|---|
| Navigation | [auto_route](https://pub.dev/packages/auto_route) |
| Http client |  [http](https://pub.dev/packages/http) |
| Golden tests | [alchemist](https://pub.dev/packages/alchemist)  |
| Localization | [easy_localization](https://pub.dev/packages/easy_localization)  |
| Local storage | [shared_preferences](https://pub.dev/packages/shared_preferences)  |
| Testing mocks | [mocktail](https://pub.dev/packages/easy_localization)  |
| Code generation | [freezed](https://pub.dev/packages/freezed)  |
| State management  |  [flutter_bloc](https://pub.dev/packages/flutter_bloc) |
| Dependency injection | [get_it](https://pub.dev/packages/get_it) [injectable](https://pub.dev/packages/injectable) |
| Remote storage & more | [firebase](https://pub.dev/packages/firebase) [flutterfire_ui](https://pub.dev/packages/flutterfire_ui) |
| Functional programming | [dartz](https://pub.dev/packages/dartz)  |

## Prerequisites

[Flutter](https://flutter.dev/docs/get-started/install "Flutter")

[Android studio](https://developer.android.com/studio/ "Android Studio")

## App architecture & main folder structure

- **core** - folder containing common files used through the app (extensions, injector, localizer,
  etc.)
- **feature** - main folder for the features in the app
    - data
        - data_sources - interfaces and implementations of data sources
        - repositories - repositories' implementations
        - dtos - data models with a 1:1 representation from remote data source, used from
          data_sources - use_case (input)
    - domain
        - models - data models used in use cases (output) & presentation layer
        - repositories - repositories' interfaces
        - use_cases - use case implementations
    - presentation
        - cubits/blocs - cubits and blocs related to the views
        - pages - feature pages
        - widgets - feature widgets
        - dialogs - dialogs
        - ...
- **res** - folder containing any resources used in the app (SVGs, CustomPainters, PNGs, strings,
  translations, etc.)
- **scripts** - folder containing any helper scripts
- **test** - folder for unit/widget/cubit & bloc/golden tests

## How to run the project

#### You should have a valid `keys.dart` file containing secrets

#### Get all dependencies by running command:

`flutter pub get`

## $# Dart defines

To run the project use the command below and fill ENV_ENVIRONMENT_SUFFIX and ENV_APP_NAME according
to the needs flutter run --dart-define=ENV_ENVIRONMENT_SUFFIX=.uat
--dart-define=ENV_APP_NAME=Looping Diary

| Name | Description | Default value | | ------------ | ------------ | ------------ | ------------ |
| ENV_APP_NAME | A variable defining how the app will be named after installation | Looping Diary |
ENV_ENVIRONMENT_SUFFIX | A variable determining the environment, choose between ".uat"/"" - where
leaving it blank means PROD environment | null |

#### Run the project in debug mode on UAT environment:

`flutter run --dart-define=ENV_ENVIRONMENT_SUFFIX=.uat --dart-define=ENV_APP_NAME='Looping Diary UAT'`

## Tests

#### To run all tests (unit/widget/cubit & bloc/golden)

`flutter test`

#### To update golden tests run

`flutter test --update-goldens`
