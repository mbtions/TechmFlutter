// // Core Concepts
// // 1. Widgets: The basic building blocks of a Flutter app.
// // 2. Stateless and Stateful Widgets: Stateless widgets are immutable, while stateful widgets can change their state.
// // 3. Build Method: The method that describes how to display the widget in terms of other widgets.
// // 4. Material Design: A design language developed by Google that Flutter uses for its widgets.
// // 5. Hot Reload: A feature that allows developers to see changes in the code immediately without restarting the app.
// // 6. Dart Language: The programming language used to write Flutter apps, which is an object-oriented, class-based language with C-style syntax.
// // 7. Asynchronous Programming: Flutter uses async/await for handling asynchronous operations, which is crucial for tasks like network requests and file I/O.
// // 8. Layout: Flutter uses a flexible layout system that allows for responsive design across different screen sizes and orientations.
// // 9. Navigation: Flutter provides a navigation system that allows for easy movement between different screens in the app.
// // 10. State Management: Flutter has various state management solutions, including Provider, Riverpod, Bloc, and GetX, to manage the app's state efficiently.
// // 11. Packages: Flutter has a rich ecosystem of packages that can be easily integrated into apps to add functionality.
// // 12. Testing: Flutter provides a robust testing framework for unit, widget, and integration tests to ensure the app's reliability and performance.
// // 13. Platform Channels: A mechanism for communicating between Dart and native code (Java/Kotlin for Android, Swift/Objective-C for iOS).
// // 14. Theming: Flutter allows for easy customization of the app's appearance through theming, including colors, fonts, and styles.
// // 15. Accessibility: Flutter provides tools and guidelines to make apps accessible to users with disabilities, including screen readers and larger touch targets.
// // 16. Internationalization: Flutter supports multiple languages and locales, making it easier to create apps for a global audience.
// // 17. Animations: Flutter has a powerful animation library that allows for smooth and complex animations to enhance the user experience.
// // 18. Gesture Detection: Flutter provides a rich set of gesture detectors to handle user interactions like taps, swipes, and drags.
// // 19. Networking: Flutter has built-in support for making HTTP requests and handling JSON data, which is essential for most apps that interact with web services.
// // 20. Storage: Flutter provides various options for local storage, including shared preferences, SQLite, and file storage, to persist data across app sessions.
// // 21. Debugging: Flutter has a robust debugging toolset, including the Dart DevTools, which provides insights into performance, memory usage, and more.
// // 22. Build and Release: Flutter provides tools for building and releasing apps for both Android and iOS platforms, including signing and publishing to app stores.
// // 23. CI/CD: Flutter can be integrated into continuous integration and continuous deployment pipelines to automate testing and deployment processes.
// // 24. Flutter Web: Flutter can also be used to build web applications, allowing for a single codebase to target multiple platforms.
// // 25. Flutter Desktop: Flutter supports building desktop applications for Windows, macOS, and Linux, expanding its reach beyond mobile and web platforms.
// // 26. Flutter DevTools: A suite of performance and debugging tools for Flutter applications, providing insights into app performance, memory usage, and more.
// // 27. Flutter Inspector: A tool for visualizing and debugging the widget tree of a Flutter application, helping developers understand the layout and structure of their app.
// // 28. Flutter CLI: The command-line interface for Flutter, allowing developers to create, build, and manage Flutter projects from the terminal.
// // 29. Flutter SDK: The software development kit that includes the Flutter framework, Dart SDK, and tools for building and deploying Flutter applications.
// // 30. Flutter Engine: The core of the Flutter framework, responsible for rendering and managing the app's UI, handling input events, and providing access to platform-specific features.

// // import 'package:flutter/material.dart';
// // void main() {
// //   runApp(
// //     MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(title: Text('My First App')),
// //         backgroundColor: Color.fromARGB(255, 200, 71, 71),
// //         body: Text('ABHISHEK'),
// //       ),
// //     ),
// //   );
// // }

// // Flutter engine -> main.dart -> main() -> runApp() -> MaterialApp -> WidgetsApp -> WidgetsBinding -> Flutter engine
// // Flutter engine -> Dart VM -> Dart code -> Flutter framework -> Dart code -> Flutter engine
// // Flutter framework -> Dart code -> Flutter engine -> Skia -> Native code (C++) -> GPU -> Screen
// // Flutter engine -> Dart VM -> Dart code -> Flutter framework -> Dart code -> Flutter engine

// // runApp => renders the widget tree to the screen
// // MaterialApp => a root widget, provides the basic structure for a Material Design app (Parent or root wdiget of the app, it encapsulates all the widgets, wraps our whole app)
// // WidgetsApp => the base class for all Flutter apps, providing the core functionality for building widgets
// // WidgetsBinding => the glue between the Flutter framework and the Flutter engine, managing the app's lifecycle and rendering

// // void main() {
// //   print(add(2,6));
// //   int sum = add2(b:8, a:10);
// //   print('sum is ${sum}');
// // }

// // int add(int a, int b) {
// //   return a+b;
// // }

// // int add2({int a=0, int b=0}) {
// //   return a+b;
// // }

// // named arguments vs positional arguments
// // named arguments => are optional and can be passed in any order, they are enclosed in curly braces {} and are defined in the function signature
// // positional arguments => are required and must be passed in the order they are defined in the function signature, they are enclosed in parentheses ()
// // and are defined in the function signature
// // named arguments are more readable and flexible, while positional arguments are more concise and easier to use in simple cases

// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(
// //     MaterialApp(
// //       home: Scaffold(
// //         backgroundColor: const Color.fromARGB(255, 82, 153, 229),
// //         // backgroundColor: const Color.fromARGB(255, 129, 195, 249),
// //         appBar: AppBar(title: Text('My First App')),
// //         body: Container(
// //           margin: const EdgeInsets.all(30.0),
// //           decoration: BoxDecoration(
// //             gradient: LinearGradient(
// //               colors: [
// //                 const Color.fromARGB(255, 113, 183, 240),
// //                 const Color.fromARGB(255, 255, 187, 182),
// //               ],
// //             ),
// //             borderRadius: BorderRadius.circular(20.0),
// //           ),
// //           child: Center(
// //             child: Text(
// //               'Hello, Meenakshi!',
// //               style: TextStyle(
// //                 fontSize: 30.0,
// //                 color: Colors.white,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     ),
// //   );
// // }

// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(
// //     MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('My First App'),
// //           backgroundColor: Colors.black,
// //           centerTitle: true,
// //           titleTextStyle: TextStyle(color: Colors.white, fontSize: 25.0),
// //         ),
// //         body: Container(
// //           decoration: BoxDecoration(
// //             gradient: LinearGradient(
// //               begin: Alignment.topLeft,
// //               end: Alignment.bottomRight,
// //               colors: [
// //                 Color.fromARGB(255, 84, 163, 247),
// //                 Color.fromARGB(255, 155, 206, 247),
// //               ],
// //             ),
// //           ),
// //           child: Center(
// //             child: Text(
// //               'Hello👋 Flutter💙!',
// //               style: TextStyle(
// //                 fontSize: 30.0,
// //                 color: Colors.white,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     ),
// //   );
// // }

// // Usually, we do not create the App the way we have created in this file.
// // The main.dart file is the entry point of the app, and it usually contains the main() function that runs the app.

// // We create a class for the App and then create an object of that class in the main() function.
// // This is the best practice to create a Flutter app, as it keeps the code organized and modular.
// // It also makes it easier to maintain and update the app in the future.

// // Widget => User defined / custom widget and Built-in widget
// // Stateless(static) and Stateful(dynamic) widgets are the two main types of widgets in Flutter.

// import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(body: Center(child: Text('Hello, Flutter!'))),
//     );
//   }
// }

// void main() {
//   runApp(MyApp());
// }

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TextWidget(textContent: 'FIRST APP'),
          backgroundColor: const Color.fromARGB(255, 243, 33, 156),
          centerTitle: true,
        ),
        body: GradientContainer(),
      ),
    ),
  );
}

/*
STATELESS WIDGET-STATIC
class name extend StatelesWidget
{
   Widget build(context){return aap ka apna widget}
}
*/

class GradientContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(233, 229, 7, 162),
            Color.fromARGB(233, 9, 66, 236),
          ],
        ),
      ),
      child: Center(child: TextWidget(textContent: 'Namaste, Flutter!')),
    );
  }
}

class TextWidget extends StatelessWidget {
  String _textContent = "";

  // Constructor with Positional Arguments
  // TextWidget(String textContent, {super.key}) {
  //   _textContent = textContent;
  // }

  // Constructor with Named Arguments
  TextWidget({super.key, String textContent = "Hello, Flutter!"}) {
    _textContent = textContent;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _textContent,
      style: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}




//flutter flow of execution
///flutter engine->
///          main.dart->
///               main()->runApp(*)
///                        ->*:MaterialApp(home)->Scaffold(body)->container(child)
//Widget->
//Two types: 1 user/custom defined() , predefined(text,img,button)
//wiget based on nature
//1.Stateless widget:static
//2.Stateful widget:dynamic

// key vs super.key