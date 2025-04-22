import 'package:flutter/material.dart';
import 'package:labcalc/telas/Proteinuria24h.dart';
import 'package:labcalc/telas/fio2.dart';
import 'package:labcalc/telas/pos.dart';
import 'package:labcalc/telas/rpc.dart';
import 'package:labcalc/telas/splashscreen.dart';
import 'package:labcalc/telas/MenuPage.dart';

// importa outras páginas quando criar

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LabCalc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFFFFEEC),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/menu': (_) => const MenuPage(),
        '/pt24': (_) => const Proteinuria24hPage(),
        '/rpc': (_) => const rpcPage(),
        '/pos': (_) => const PosPage(),
        '/fio2': (_) => const Fio2Page(),
      },
    );
  }
}
