# Looping Diary

## Project basic info

The main idea of the project is to let users fill in their daily journal entries and see their
entries from previous years on the same day, letting them contemplate and see how they changed
throughout the years.

Project is created using Clean Architecture.

##### PlayStore:

<a href='https://play.google.com/store/apps/details?id=com.app.looping_diary'><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png' width="170"/></a>

## Basic project presentation

| - | - | - | - | - |
|---|---|---|---|---|
|![screenshot1](https://user-images.githubusercontent.com/58911502/174785428-f1e193b2-9ac0-4a05-bc85-4e07aa997249.jpeg)|![screenshot2](https://user-images.githubusercontent.com/58911502/174785532-0ba2e0da-d073-4d7a-8369-e3bf7cfae228.jpeg)|![screenshot3](https://user-images.githubusercontent.com/58911502/175160158-c30106c0-3bef-4305-b138-88fbd2fb2bd1.jpeg)|![screenshot4](https://user-images.githubusercontent.com/58911502/177287947-e9ba278b-dbd8-4014-a292-f653013af3c4.jpeg)|![screenshot5](https://user-images.githubusercontent.com/58911502/174785587-ed7454eb-e425-4cdc-b234-226564c10d49.jpeg)|

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

## Translations
#### To add new translations declare a string key in `strings.dart`, then declare it's translations in corresponding .json files, currently available in `en.json` and `pl.json`, then use it in the widget with `key.tr()` call.
#### Example:

`strings.dart`
```
const String someKey = 'someKey';
```
`en.json`
```
{
  "someKey" : "some text"
}
```
`some_widget.dart`
```
Text(someKey.tr());
```

## How to run the project

#### You should have a valid `keys.dart` file containing secrets

#### Get all dependencies by running command:

`flutter pub get`

#### Dart defines

| Name | Description | Default value |
| ------------ | ------------ | ------------ |
| ENV_APP_NAME | A variable defining how the app will be named after installation | Looping Diary |
| ENV_ENVIRONMENT_SUFFIX | A variable determining the environment, choose between ".uat"/"" - where leaving it blank means PROD environment | null |

#### Run the project in debug mode on UAT environment:

`flutter run --dart-define=ENV_ENVIRONMENT_SUFFIX=.uat --dart-define=ENV_APP_NAME='Looping Diary UAT'`

## Tests

#### To run all tests (unit/widget/cubit & bloc/golden)

`flutter test`

#### To update golden tests run

`flutter test --update-goldens`
