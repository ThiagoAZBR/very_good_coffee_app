# Very Good Coffee App

Some requirements:

● Open the app and load a new coffee image from the network

● Load a new coffee image if the current one is not my favorite

● Save the current coffee image locally if I really like it, so I can access my favorite coffee images at any time, even if I don’t have internet access

Also:
    <br>○ Make sure any loading/error states are handled correctly

The API that was used: [Coffee API - AlexFlipnote](https://github.com/AlexFlipnote/CoffeeAPI)

## Architecture

The App was build using [Clean Arch](https://github.com/Flutterando/Clean-Dart/blob/master/README_en.md) in mind with some functional programming with the package [fpdart](https://pub.dev/packages/fpdart). 

To deal with the state management was used a native tool called valueNotifier but with the package [rx_notifier](https://pub.dev/packages/rx_notifier) that enhances this native feat.

In the dependencies, to deal with some concepts like dependency injection was used [get_it](https://pub.dev/packages/get_it).

The create the logic for local data and caching, were used [cached_network_image](https://pub.dev/packages/cached_network_image) and [shared_preferences](https://pub.dev/packages/shared_preferences).

For working with API and http networking was used [dio](https://pub.dev/packages/dio).


## Getting Started

This project was made using Flutter.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

> **I recommend to use VScode, for a better experience. But in case you don't have access to it, use the terminal**

## Running Tests and Application in Flutter

### Running Tests
#### Open Terminal:

Launch your terminal or command prompt.
Navigate to Your Flutter Project:

Use the cd command to change directory to your Flutter project directory.

```bash
cd path_to_your_flutter_project
```
Replace path_to_your_flutter_project with the actual path where your Flutter project is located.

#### Run Tests:

To execute all tests (unit tests), use the following command:
```bash
flutter test
```
This command will run all the test files present in your project and show the results in the terminal.

#### Running Specific Tests:

If you want to run tests from a specific directory or file, you can specify it like this:

```bash
flutter test test/widget_tests/my_widget_test.dart
```
Replace test/widget_tests/my_widget_test.dart with the path to your specific test file.
#
### Running the Application
#### Open Terminal:

Ensure you have the terminal or command prompt open.
#### Navigate to Your Flutter Project:

Again, use the cd command to navigate to your Flutter project directory if you're not already there.
#### Launch the Application:

To run your Flutter application on an attached device or simulator, use the following command:
```bash
flutter run
```
This command builds and deploys your Flutter app to the connected device or simulator.
#### Hot Reload:

While the application is running, you can make changes to your Dart code. Save the changes, and Flutter's hot reload feature will automatically update the running application with your modifications.

```vbnet
Press "r" to hot reload.
Press "R" to hot restart.
```
#### Stopping the Application:

To stop the application, press Ctrl + C in the terminal where flutter run is running.
