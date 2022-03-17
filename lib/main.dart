import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StreamBuilder Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'StreamBuilder Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "MY SCORE",
              style: TextStyle(fontSize: 24.0),
            ),

            const SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ScoreSelectionButtons(
                    value: 10,
                    color: Colors.red,
                    onPressed: () {}),
                ScoreSelectionButtons(
                    value: 20,
                    color: Colors.amber,
                    onPressed: () {}),
                ScoreSelectionButtons(
                    value: 30,
                    color: Colors.green,
                    onPressed: () {}),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Close connection"),
            )
          ],
        ),
      ),
    );
  }

  Widget _scoreWidget(ConnectionState state, int value) {
    return Column(
      children: <Widget>[
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
        ),
        Text(
          "Status is: $state",
          style: const TextStyle(fontSize: 20.0),
        ),
      ],
    );
  }
}

class ScoreSelectionButtons extends StatelessWidget {
  final int value;
  final VoidCallback onPressed;
  final Color color;

  const ScoreSelectionButtons(
      {Key? key,
      required this.value,
      required this.onPressed,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
          padding:
              MaterialStateProperty.resolveWith((states) => EdgeInsets.zero)),
      child: SizedBox(
        height: 100.0,
        width: 100.0,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
          elevation: 3.0,
          color: color,
          child: Center(
            child: Text(
              value.toString(),
              style: const TextStyle(fontSize: 30.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
