# Looping Diary

## Project basic info

The main idea of the project is to let users fill in their daily journal entries and see their
entries from previous years on the same day, letting them contemplate and see how they changed
throughout the years.

Project is created using Clean Architecture.

### Technology stack & main project dependencies

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

### Prerequisites

[Flutter](https://flutter.dev/docs/get-started/install "Flutter")
[Android studio](https://developer.android.com/studio/ "Android Studio")

### Secrets

**1**. You should have a valid `keys.dart` file containing secrets

### Clean Architecture used in the app & main folder structure

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

### How to run the project

#### Get all dependencies by running command:

`flutter pub get`

#### Run the project in debug mode:

`flutter run --debug`

### Tests

#### To run all tests (unit/widget/cubit & bloc/golden)

`flutter test`

#### To update golden tests run

`flutter test --update-goldens`