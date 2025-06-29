import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagementdemoapp/list_provider.dart';
import 'package:statemanagementdemoapp/screens/third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SecondScreenState();
  }
}

class SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      // this child will have a static part that will not be re-build by the consumer again
      builder: (BuildContext context, NumberListProvider nlp, Widget? child) =>
          Scaffold(
            appBar: AppBar(title: Text("Second Screen")),
            body: Column(
              children: [
                Text(
                  nlp.numbers.isNotEmpty ? nlp.numbers.last.toString() : "",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: nlp.numbers.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        nlp.numbers[index].toString(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ThirdScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Third Screen",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  nlp.add();
                });
              },
              child: Icon(Icons.add, size: 30),
            ),
          ),
    );
  }
}
