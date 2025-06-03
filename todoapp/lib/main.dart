import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todoapp/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/Task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ToDoApp());
}

final ThemeNotifier themeNotifier = ThemeNotifier();

// search task and remove the task list temporarily
// filter task based on the status of done or undone
// shared preferences to save the task list

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  SharedPreferences? prefs;
  final TextEditingController textEditingController = TextEditingController();
  List<Task> allTasks = [];

  @override
  void initState() {
    super.initState();
    _initializePrefs();
  }

  Future<void> _initializePrefs() async {
    prefs = await SharedPreferences.getInstance();
    _loadTasks();
  }

  void _loadTasks() {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // List<String>? taskData = prefs.getStringList('tasks');
    // setState(() {
    //   allTasks = taskData!.cast<Task>();
    // });

    final taskData = prefs?.getStringList('tasks');
    if (taskData != null) {
      setState(() {
        allTasks =
            taskData.map((taskString) {
              return Task.fromJson(jsonDecode(taskString));
            }).toList();
      });
    }

    // List<String>? taskData = prefs.getStringList('tasks');
    // if (taskData != null) {
    //   setState(() {
    //     allTasks =
    //         taskData
    //             .map(
    //               (taskString) => Task.fromJson(
    //                 Map<String, dynamic>.from(jsonDecode(taskString)),
    //               ),
    //             )
    //             .toList();
    //   });
    // }
  }

  Future<void> _saveTask() async {
    await prefs?.setStringList(
      'tasks',
      allTasks.map((task) => jsonEncode(task.toJson())).toList(),
    );
    // prefs.setStringList('tasks', allTasks.cast<String>());
    // prefs.setStringList(
    //   'tasks',
    //   allTasks.map((task) => jsonEncode(task.toJson())).toList(),
    // );
    // print(prefs);
  }

  void onAddTaskButtonPressed() {
    setState(() {
      allTasks.add(Task(title: textEditingController.text));
      textEditingController.clear();
      // print(allTasks);
    });
    _saveTask();
  }

  void onDeleteTaskButtonPressed(int index) {
    setState(() {
      allTasks.removeAt(index);
    });
    _saveTask();
  }

  void onDeleteAllTasksButton() {
    setState(() {
      allTasks.clear();
    });
    prefs?.remove('tasks');
  }

  void onEditTaskButtonPressed(int index) {
    setState(() {
      allTasks[index].updateTitle(textEditingController.text);
      textEditingController.clear();
    });
    _saveTask();
  }

  void longPressCallback(int index) {
    onDeleteTaskButtonPressed(index);
  }

  void taskChecked(int index) {
    setState(() {
      allTasks[index].toggleDone();
    });
    _saveTask();
  }

  Widget taskCard(int index) {
    final task = allTasks[index];

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Color.fromARGB(255, 3, 25, 86),
      // Color.fromARGB(243, 27, 127, 227),
      // child: Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Checkbox(
              // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              // visualDensity: VisualDensity.compact,
              splashRadius: 40,
              shape: const CircleBorder(side: BorderSide(color: Colors.white)),
              checkColor: Colors.white70,
              activeColor: Color.fromARGB(255, 234, 5, 255),
              // Color.fromARGB(255, 70, 90, 161),
              side: const BorderSide(color: Colors.white70, width: 2),
              value: task.isDone,
              // onChanged: (bool? value) {
              //   setState(() {
              //     allTasks[index].isDone = !allTasks[index].isDone;
              //   });
              // },
              onChanged: (_) => taskChecked(index),
            ),
            Expanded(
              // child: Padding(
              //   padding: const EdgeInsets.all(8.0),
              child: Text(
                task.title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  decoration: task.isDone ? TextDecoration.lineThrough : null,
                  decorationColor: Color.fromARGB(255, 234, 5, 255),
                  decorationThickness: 2,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
              // ),
            ),
            IconButton(
              color: Colors.white,
              onPressed: () => {onDeleteTaskButtonPressed(index)},
              icon: Icon(Icons.delete),
            ),
            IconButton(
              color: Colors.white,
              onPressed: () => onEditTaskButtonPressed(index),
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
      ),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeNotifier,
      builder: (context, _) {
        return MaterialApp(
          title: 'To Do App',
          theme: themeNotifier.currentTheme,
          home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'TO DO APP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                // Switch(
                //   value: themeNotifier.isDarkMode,
                //   onChanged: (_) => themeNotifier.toggleTheme(),
                // ),
                IconButton(
                  icon: Icon(
                    themeNotifier.isDarkMode
                        ? Icons.nightlight_round
                        : Icons.wb_sunny,
                    color: Colors.white,
                  ),
                  onPressed: () => setState(() => themeNotifier.toggleTheme()),
                ),
              ],
              backgroundColor: Color.fromARGB(255, 3, 25, 86),
              // Color.fromARGB(243, 27, 127, 227),
            ),
            body:
            // Container(
            Padding(
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     colors: [
              //       Color.fromARGB(255, 52, 79, 161),
              //       Color.fromARGB(243, 27, 127, 227),
              //     ],
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight,
              //   ),
              // ),
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: allTasks.length,
                      itemBuilder: (context, index) => taskCard(index),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child:
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Color.fromARGB(255, 3, 25, 86),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Type your task here...',
                                hintStyle: TextStyle(
                                  color: Colors.blue.shade100,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blue.shade400,
                                    width: 2,
                                  ),
                                ),
                              ),
                              controller: textEditingController,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 234, 5, 255),
                              // Colors.white,
                              padding: EdgeInsets.all(10),
                              shape: const CircleBorder(),
                            ),
                            onPressed: () => {onAddTaskButtonPressed()},
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                              // Color.fromARGB(255, 3, 25, 86),
                              // Color.fromARGB(255, 234, 5, 255),
                            ),
                            // child: Text(
                            //   "+",
                            //   style: TextStyle(
                            //     color: Color.fromARGB(243, 27, 127, 227),
                            //     fontSize: 25,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
