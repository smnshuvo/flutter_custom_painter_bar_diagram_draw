import 'package:flutter/material.dart';
import 'package:flutter_custom_painter_bar_diagram/bar_diagram_painter.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomPaint(
          painter: BarDiagramPainter(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            height: 400,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}

