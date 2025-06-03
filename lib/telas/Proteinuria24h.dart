import 'package:flutter/material.dart';

class Proteinuria24hPage extends StatefulWidget {
  const Proteinuria24hPage({super.key});

  @override
  State<Proteinuria24hPage> createState() => _Proteinuria24hPageState();
}

class _Proteinuria24hPageState extends State<Proteinuria24hPage> {
  final TextEditingController _volumeController = TextEditingController();
  final TextEditingController _concentrationController =
      TextEditingController();
  double? _resultado;

  void _calcular() {
    final volume = double.tryParse(_volumeController.text.replaceAll(',', '.'));
    final concentracao = double.tryParse(
      _concentrationController.text.replaceAll(',', '.'),
    );

    if (volume != null && concentracao != null) {
      double resultado = (volume * concentracao) / 100;
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
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Proteinúria de 24h',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Volume total da urina de 24h (ml):',
              style: TextStyle(color: Colors.green, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _volumeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Concentração da proteína urinária (mg/dL):',
              style: TextStyle(color: Colors.green, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _concentrationController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Resultado (mg/24h):',
              style: TextStyle(fontSize: 20, color: Colors.green),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Container(
              width: 200,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
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
              'A formula para calculo da proteinúria é: (Volume X proteina ÷ 100)\n',
              style: TextStyle(fontSize: 24, color: Colors.green),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Valores de referência: \nProteinúria normal: até 150 mg/24h. \nProteinúria limítrofe: entre 150 e 300 mg/24h. \nProteinúria moderada: entre 300 mg e 3,5 g/24h \nProteinúria nefrótica: acima de 3,5 g/24h. ',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 252, 0, 0),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
