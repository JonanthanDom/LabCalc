import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black, // para o texto branco aparecer
        body: Center(
          child: Text(
            'Calculadora laboratorial',
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
        ),
      ),
    ),
  );
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
