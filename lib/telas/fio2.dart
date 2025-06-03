import 'package:flutter/material.dart';

class Fio2Page extends StatefulWidget {
  const Fio2Page({super.key});

  @override
  State<Fio2Page> createState() => _Fio2PageState();
}

class _Fio2PageState extends State<Fio2Page> {
  final TextEditingController _volumeController = TextEditingController();

  double? _resultado;

  void _calcular() {
    final volume = double.tryParse(_volumeController.text.replaceAll(',', '.'));

    if (volume != null) {
      double resultado = (volume * 4) + 21;
      setState(() {
        _resultado = resultado;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEEC),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(105, 187, 147, 1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 248, 250, 248),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'FiO2',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            // campo volume
            const SizedBox(height: 80),
            const Text(
              'Volume oxigênio (L/min):',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.green, fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _volumeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            //Campo resultado
            const SizedBox(height: 40),
            const Text(
              'FiO2 (%):',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 12),
            Container(
              width: 200,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _resultado != null ? _resultado!.toStringAsFixed(0) : '',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, color: Colors.red),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _calcular, child: const Text('Calcular')),
            const SizedBox(height: 24),
            const Text(
              ' A fórmula para o cálcular o FiO2 é: (Volume X 4 + 21)',
              style: TextStyle(fontSize: 24, color: Colors.green),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
