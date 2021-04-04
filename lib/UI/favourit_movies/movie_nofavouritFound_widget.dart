import 'package:flutter/material.dart';

class NoFileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(
              image: AssetImage('assets/ae8ac2fa217d23aadcc913989fcc34a2.png'),
              fit: BoxFit.fitWidth,
              height: double.infinity,
              width: double.infinity),
        ],
      ),
    );
  }
}
