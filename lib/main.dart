import 'package:flutter/material.dart';
import 'package:stromlesser_app/stromlesserScreen.dart';

void main() {
  runApp(StromleserApp());
}

class StromleserApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StromleserScreen(),
      theme: ThemeData.dark(),
    );
  }
}
