// Core Concepts
// 1. Widgets: The basic building blocks of a Flutter app.
// 2. Stateless and Stateful Widgets: Stateless widgets are immutable, while stateful widgets can change their state.
// 3. Build Method: The method that describes how to display the widget in terms of other widgets.
// 4. Material Design: A design language developed by Google that Flutter uses for its widgets.
// 5. Hot Reload: A feature that allows developers to see changes in the code immediately without restarting the app.
// 6. Dart Language: The programming language used to write Flutter apps, which is an object-oriented, class-based language with C-style syntax.
// 7. Asynchronous Programming: Flutter uses async/await for handling asynchronous operations, which is crucial for tasks like network requests and file I/O.
// 8. Layout: Flutter uses a flexible layout system that allows for responsive design across different screen sizes and orientations.
// 9. Navigation: Flutter provides a navigation system that allows for easy movement between different screens in the app.
// 10. State Management: Flutter has various state management solutions, including Provider, Riverpod, Bloc, and GetX, to manage the app's state efficiently.
// 11. Packages: Flutter has a rich ecosystem of packages that can be easily integrated into apps to add functionality.
// 12. Testing: Flutter provides a robust testing framework for unit, widget, and integration tests to ensure the app's reliability and performance.
// 13. Platform Channels: A mechanism for communicating between Dart and native code (Java/Kotlin for Android, Swift/Objective-C for iOS).
// 14. Theming: Flutter allows for easy customization of the app's appearance through theming, including colors, fonts, and styles.
// 15. Accessibility: Flutter provides tools and guidelines to make apps accessible to users with disabilities, including screen readers and larger touch targets.
// 16. Internationalization: Flutter supports multiple languages and locales, making it easier to create apps for a global audience.
// 17. Animations: Flutter has a powerful animation library that allows for smooth and complex animations to enhance the user experience.
// 18. Gesture Detection: Flutter provides a rich set of gesture detectors to handle user interactions like taps, swipes, and drags.
// 19. Networking: Flutter has built-in support for making HTTP requests and handling JSON data, which is essential for most apps that interact with web services.
// 20. Storage: Flutter provides various options for local storage, including shared preferences, SQLite, and file storage, to persist data across app sessions.
// 21. Debugging: Flutter has a robust debugging toolset, including the Dart DevTools, which provides insights into performance, memory usage, and more.
// 22. Build and Release: Flutter provides tools for building and releasing apps for both Android and iOS platforms, including signing and publishing to app stores.
// 23. CI/CD: Flutter can be integrated into continuous integration and continuous deployment pipelines to automate testing and deployment processes.
// 24. Flutter Web: Flutter can also be used to build web applications, allowing for a single codebase to target multiple platforms.
// 25. Flutter Desktop: Flutter supports building desktop applications for Windows, macOS, and Linux, expanding its reach beyond mobile and web platforms.
// 26. Flutter DevTools: A suite of performance and debugging tools for Flutter applications, providing insights into app performance, memory usage, and more.
// 27. Flutter Inspector: A tool for visualizing and debugging the widget tree of a Flutter application, helping developers understand the layout and structure of their app.
// 28. Flutter CLI: The command-line interface for Flutter, allowing developers to create, build, and manage Flutter projects from the terminal.
// 29. Flutter SDK: The software development kit that includes the Flutter framework, Dart SDK, and tools for building and deploying Flutter applications.
// 30. Flutter Engine: The core of the Flutter framework, responsible for rendering and managing the app's UI, handling input events, and providing access to platform-specific features.
// 31. Flutter Framework: The high-level framework built on top of the Flutter engine, providing a rich set of widgets and tools for building user interfaces.
// 32. Flutter Packages: A collection of reusable code libraries that can be easily integrated into Flutter applications to add functionality and features.
// 33. Flutter Plugins: A special type of package that provides access to native platform APIs, allowing Flutter apps to interact with device features like camera, GPS, and sensors.
// 34. Flutter Widgets: The building blocks of a Flutter app, which can be combined to create complex user interfaces. Widgets can be stateful or stateless, and they can be composed to create custom widgets.
// 35. Flutter Layout: The process of arranging widgets on the screen, which can be done using various layout widgets like Row, Column, Stack, and GridView. Flutter's layout system is flexible and allows for responsive design across different screen sizes and orientations.
// 36. Flutter Animation: A powerful animation library that allows developers to create smooth and complex animations to enhance the user experience. Flutter provides built-in animation widgets and tools for creating custom animations.
// 37. Flutter Testing: A robust testing framework for unit, widget, and integration tests to ensure the app's reliability and performance. Flutter provides tools for writing and running tests, as well as for mocking dependencies and verifying behavior.
// 38. Flutter Internationalization: Support for multiple languages and locales, making it easier to create apps for a global audience. Flutter provides tools for managing translations and localizing content based on the user's locale.

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 82, 153, 229),
        // backgroundColor: const Color.fromARGB(255, 129, 195, 249),
        appBar: AppBar(title: Text('My First App')),
        body: Container(
          margin: const EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 113, 183, 240),
                const Color.fromARGB(255, 255, 187, 182),
              ],
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Text(
              'Hello, Meenakshi!',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

// Flutter engine -> main.dart
// main.dart -> main() -> runApp() -> MaterialApp -> WidgetsApp -> WidgetsBinding -> Flutter engine
// Flutter engine -> Dart VM -> Dart code -> Flutter framework -> Dart code -> Flutter engine
// Flutter framework -> Dart code -> Flutter engine -> Skia -> Native code (C++) -> GPU -> Screen
// Flutter engine -> Dart VM -> Dart code -> Flutter framework -> Dart code -> Flutter engine


// runApp => renders the widget tree to the screen
// MaterialApp => a root widget, provides the basic structure for a Material Design app (Parent or root wdiget of the app, it encapsulates all the widgets, wraps our whole app)
// WidgetsApp => the base class for all Flutter apps, providing the core functionality for building widgets
// WidgetsBinding => the glue between the Flutter framework and the Flutter engine, managing the app's lifecycle and rendering

// void main() {
//   print(add(2,6));
//   int sum = add2(b:8, a:10);
//   print('sum is ${sum}');
// }


// int add(int a, int b) {
//   return a+b;
// }

// int add2({int a=0, int b=0}) {
//   return a+b;
// }

// named arguments vs positional arguments
// named arguments => are optional and can be passed in any order, they are enclosed in curly braces {} and are defined in the function signature
// positional arguments => are required and must be passed in the order they are defined in the function signature, they are enclosed in parentheses ()
// and are defined in the function signature
// named arguments are more readable and flexible, while positional arguments are more concise and easier to use in simple cases