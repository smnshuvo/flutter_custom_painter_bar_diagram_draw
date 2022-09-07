import 'package:flutter/material.dart';

const APP_TITLE = "BAR DIAGRAM";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const GraphViewScreen(),
    );
  }
}

class GraphViewScreen extends StatelessWidget {
  const GraphViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(APP_TITLE),),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        height: 600,
        width: 600,
      ),
    );
  }
}

