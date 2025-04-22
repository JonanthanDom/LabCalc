import 'package:flutter/material.dart';
import 'package:labcalc/telas/MenuPage.dart';

// Splash com imagem
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 800),
          pageBuilder: (_, __, ___) => const MenuPage(),
          transitionsBuilder: (_, Animation, __, child) {
            return FadeTransition(opacity: Animation, child: child);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(105, 187, 147, 1),
      body: Center(
        child: Image.asset(
          'assets/logo.png', // Caminho da imagem
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
