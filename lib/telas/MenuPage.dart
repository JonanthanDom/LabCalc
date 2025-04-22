import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LabCalc',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFFFFEEC), // cor clara
      ),
      home: const MenuPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // aumenta altura
        child: AppBar(
          backgroundColor: const Color(0xFF6BBB93),
          centerTitle: true,
          title: Column(
            children: [
              Image.asset('assets/appbar.png', height: 70), // Logo PNG
              const SizedBox(height: 0),
              const Text(
                'LabCalc',
                style: TextStyle(
                  fontSize: 0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _menuButton(context, 'Proteinúria de 24h', '/pt24'),
            _menuButton(context, 'Relação proteína\ncreatinina (RPC)', '/rpc'),
            _menuButton(context, 'Cálculo de\nuréia pós', '/ureia'),
            _menuButton(context, 'Cálculo de FiO2', '/fio2'),
          ],
        ),
      ),
    );
  }

  Widget _menuButton(BuildContext context, String label, String route) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFFECE),
        foregroundColor: Colors.green[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: const TextStyle(fontSize: 16),
        padding: const EdgeInsets.all(12),
      ),
      child: Text(label, textAlign: TextAlign.center),
    );
  }
}
