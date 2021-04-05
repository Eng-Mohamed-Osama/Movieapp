import 'package:flutter/material.dart';

class NoFileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(
              image: AssetImage('assets/nofilefound.png'),
              fit: BoxFit.fitWidth,
              height: double.infinity,
              width: double.infinity),
        ],
      ),
    );
  }
}
