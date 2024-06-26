import 'package:flutter/material.dart';
import 'package:vazifa15/my_cloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clock Animation '),
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          color: const Color.fromARGB(255, 77, 16, 95),
          child: const MyClock(),
        ),
      ),
    );
  }
}
