// import 'package:flutter/material.dart';
// import 'package:todoapp/widgets/task_tile.dart';

// void main() {
//   runApp(const ToDoApp());
// }

// class ToDoApp extends StatefulWidget {
//   const ToDoApp({super.key});

//   @override
//   State<ToDoApp> createState() => _ToDoAppState();
// }

// class _ToDoAppState extends State<ToDoApp> {
//   final List<String> allTasks = [
//     'PSOSM on 21st May',
//     'Internet of Things on 26th May',
//     'Mobile Computing on 28th May',
//   ];

//   final List<bool> checkedTasks = [false, false, false];

//   final TextEditingController textController = TextEditingController();

//   void addTask() {
//     final text = textController.text.trim();
//     if (text.isEmpty) return;

//     setState(() {
//       allTasks.add(text);
//       checkedTasks.add(false);
//       textController.clear();
//     });
//   }

//   void removeTask(int index) {
//     setState(() {
//       allTasks.removeAt(index);
//       checkedTasks.removeAt(index);
//     });
//   }

//   void toggleTask(int index, bool? value) {
//     if (value == null) return;
//     setState(() {
//       checkedTasks[index] = value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text(
//             'TO DO APP',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           backgroundColor: const Color.fromARGB(243, 27, 127, 227),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Expanded(
//                 child: Text('Task A'),
//                 // ListView.builder(
//                 //   itemCount: allTasks.length,
//                 //   itemBuilder: (context, index) {
//                 //     return Card(
//                 //       elevation: 6,
//                 //       shape: RoundedRectangleBorder(
//                 //         borderRadius: BorderRadius.circular(10),
//                 //       ),
//                 //       child: TaskTile(
//                 //         taskTitle: allTasks[index],
//                 //         taskCompleted: checkedTasks[index],
//                 //         checkboxCallback: (value) => toggleTask(index, value),
//                 //         onDeletePress: () => removeTask(index),
//                 //         longPressCallback: () => removeTask(index),
//                 //       ),
//                 //     );
//                 //   },
//                 // ),
//               ),
//               Card(
//                 elevation: 8,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 color: const Color.fromARGB(243, 27, 127, 227),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: TextField(
//                           controller: textController,
//                           style: const TextStyle(color: Colors.white),
//                           decoration: InputDecoration(
//                             hintText: 'Type your task here...',
//                             hintStyle: TextStyle(color: Colors.blue.shade100),
//                             enabledBorder: const OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.white,
//                                 width: 2,
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.blue.shade400,
//                                 width: 2,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(3.0),
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           padding: const EdgeInsets.all(10),
//                           shape: const CircleBorder(),
//                         ),
//                         onPressed: addTask,
//                         child: const Text(
//                           "+",
//                           style: TextStyle(
//                             color: Color.fromARGB(243, 27, 127, 227),
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// // import 'package:flutter/material.dart';
// // import 'package:todoapp/widgets/task_tile.dart';

// // void main() {
// //   runApp(const ToDoApp());
// // }

// // class ToDoApp extends StatefulWidget {
// //   const ToDoApp({super.key});

// //   @override
// //   State<ToDoApp> createState() => _ToDoAppState();
// // }

// // class _ToDoAppState extends State<ToDoApp> {
// //   List<String> allTasks = [
// //     'PSOSM on 21st May',
// //     'Internet of Things on 26th May',
// //     'Mobile Computing on 28th May',
// //   ]; // to store all of the tasks
// //   TextEditingController textEditingController = TextEditingController();
// //   List<bool> checkedTasks = [
// //     false,
// //     false,
// //     false,
// //   ]; // to store the state of each task
// //   bool checkboxState = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     // textEditingController = TextEditingController();
// //   }

// //   onAddTaskButtonPressed() {
// //     setState(() {
// //       allTasks.add(textEditingController.text);
// //       checkedTasks.add(checkboxState);
// //     });
// //   }

// //   onDeleteTaskButtonPressed(int index) {
// //     setState(() {
// //       allTasks.removeAt(index);
// //       checkedTasks.removeAt(index);
// //     });
// //   }

// //   longPressCallback(int index) {
// //     setState(() {
// //       allTasks.removeAt(index);
// //       checkedTasks.removeAt(index);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           centerTitle: true,
// //           // leading: Icon(Icons.check_circle, color: Colors.white),
// //           title: Text(
// //             'TO DO APP',
// //             style: TextStyle(
// //               color: Colors.white,
// //               fontSize: 20,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           backgroundColor: Color.fromARGB(243, 27, 127, 227),
// //         ),
// //         body: Container(
// //           padding: EdgeInsets.all(8),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.end,
// //             children: [
// //               Expanded(
// //                 child: ListView.builder(
// //                   itemCount: allTasks.length,
// //                   itemBuilder: (context, index) {
// //                     return Card(
// //                       elevation: 6,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                       ),
// //                       child: TaskTile(
// //                         taskTitle: allTasks[index],
// //                         taskCompleted: checkedTasks[index],
// //                         longPressCallback: () => {longPressCallback(index)},
// //                         onDeletePress: () => {onDeleteTaskButtonPressed(index)},
// //                         checkboxCallback: (checkboxState) {
// //                           setState(() {
// //                             checkedTasks[index] = checkboxState!;
// //                           });
// //                         },
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Card(
// //                   elevation: 8,
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //                   color: Color.fromARGB(243, 27, 127, 227),
// //                   child: Row(
// //                     children: [
// //                       Expanded(
// //                         child: Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: TextField(
// //                             style: TextStyle(color: Colors.white),
// //                             decoration: InputDecoration(
// //                               hintText: 'Type your task here...',
// //                               hintStyle: TextStyle(color: Colors.blue.shade100),
// //                               enabledBorder: OutlineInputBorder(
// //                                 borderSide: BorderSide(
// //                                   color: Colors.white,
// //                                   width: 2,
// //                                 ),
// //                               ),
// //                               focusedBorder: OutlineInputBorder(
// //                                 borderSide: BorderSide(
// //                                   color: Colors.blue.shade400,
// //                                   width: 2,
// //                                 ),
// //                               ),
// //                             ),
// //                             controller: textEditingController,
// //                           ),
// //                         ),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.all(3.0),
// //                         child: ElevatedButton(
// //                           style: ElevatedButton.styleFrom(
// //                             backgroundColor: Colors.white,
// //                             padding: EdgeInsets.all(10),
// //                             shape: CircleBorder(),
// //                           ),
// //                           onPressed: onAddTaskButtonPressed,
// //                           child: Text(
// //                             "+",
// //                             style: TextStyle(
// //                               color: Color.fromARGB(243, 27, 127, 227),
// //                               fontSize: 25,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // 1. create task 
// // // 2. task list
// // // 3. edit task
// // // 4. done / undone task
// // // 5. delete task

// // // to create a task, user must enter text in a textfield and it gets added to the task list
// // // to edit a task, a task must 