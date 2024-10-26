import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(StromleserApp());
}

class StromleserApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StromleserScreen(),
      theme: ThemeData.dark(),
    );
  }
}

class StromleserScreen extends StatefulWidget {
  @override
  StromleserScreenState createState() => StromleserScreenState();
}

class StromleserScreenState extends State<StromleserScreen> {
  int consumption = 0;
  final Random random = Random();
  Timer? timer;
  bool isRunning = false;

  void toggleReading() {
    if (isRunning) {
      // Stop the timer
      timer?.cancel();
    } else {
      timer = Timer.periodic(Duration(seconds: 3), (Timer t) {
        setState(() {
          consumption = random.nextInt(500);
        });
      });
    }
    setState(() {
      isRunning = !isRunning;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('MoeCellNicco'),
        actions: const [
          Icon(Icons.settings),
        ],
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/images/stromlesser-nb.png',
                height: 150,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      'Ausgang',
                      style: TextStyle(fontSize: 18, color: Colors.grey[500]),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      '--',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: toggleReading,
                      icon: Icon(
                        Icons.power_settings_new,
                        color: isRunning ? Colors.red : Colors.white,
                      ),
                      iconSize: 40,
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.timer),
                      iconSize: 40,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Energy',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.grey),
                        SizedBox(width: 5),
                        Text(
                          '2024-10-25',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Consumption',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    '$consumption KWH',
                    style: const TextStyle(
                        fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Center(
              child: Icon(Icons.menu, size: 40, color: Colors.grey),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
