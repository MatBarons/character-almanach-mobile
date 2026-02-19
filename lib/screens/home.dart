import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character Almanach'),
      ),
      body: Center(
        child: Text('Welcome to Character Almanach!'),
      ),
    );
  }
}