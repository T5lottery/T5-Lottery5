import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('T5 Lottery'),
      ),
      body: Center(
        child: Text('Welcome to T5 Lottery App!'),
      ),
    );
  }
}
