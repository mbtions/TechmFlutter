import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagementdemoapp/list_provider.dart';

class ThirdScreen extends StatefulWidget {
  @override
  State<ThirdScreen> createState() {
    return ThirdScreenState();
  }
}

class ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, NumberListProvider nlp, Widget? child) =>
          Scaffold(
            appBar: AppBar(title: Text("Third Screen")),
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
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  nlp.multiply();
                });
              },
              child: Icon(Icons.cancel, size: 30),
            ),
          ),
    );
  }
}
