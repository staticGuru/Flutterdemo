import 'package:flutter/material.dart';
import 'dart:ui';

class ChoosenLoacation extends StatefulWidget {
  ChoosenLoacation({Key? key}) : super(key: key);

  @override
  _ChoosenLoacationState createState() => _ChoosenLoacationState();
}

class _ChoosenLoacationState extends State<ChoosenLoacation> {
  var counter = 1;
  @override
  void initState() {
    super.initState();
    print("init state called");
  }

  @override
  Widget build(BuildContext context) {
    print("build method called");
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue[200],
              title: const Text(
                "Choose the locations",
                style: TextStyle(color: Colors.red),
              ),
              centerTitle: true,
              elevation: 10,
            ),
            body: TextButton(
                onPressed: () {
                  setState(() {
                    counter += 1;
                  });
                },
                child: Text("click Me ${counter}"))));
  }
}
