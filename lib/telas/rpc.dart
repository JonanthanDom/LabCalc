import 'package:flutter/material.dart';

class rpcPage extends StatefulWidget {
  const rpcPage({super.key});

  @override
  State<rpcPage> createState() => _rpcPageState();
}

class _rpcPageState extends State<rpcPage> {
  final TextEditingController _proteinaController = TextEditingController();
  final TextEditingController _creatininaController = TextEditingController();

  double? _resultado;

  void _calcular() {
    final proteina = double.tryParse(
      _proteinaController.text.replaceAll(',', '.'),
    );
    final creatinina = double.tryParse(
      _creatininaController.text.replaceAll(',', '.'),
    );

    if (creatinina != null && proteina != null) {
      double resultado = proteina / creatinina;
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
          'Relação proteína/creatinina',
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
              'Concentração da proteína urinária (mg/dL):',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.green, fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _proteinaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            //Campo proteina
            const SizedBox(height: 40),
            const Text(
              'Concentração da creatinina urinária (mg/dL):',
              style: TextStyle(color: Colors.green, fontSize: 16),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _creatininaController,
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
              'Resultado (mg/mg):',
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
                _resultado != null ? _resultado!.toStringAsFixed(3) : '',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, color: Colors.red),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _calcular, child: const Text('Calcular')),

            const SizedBox(height: 24),
            const Text(
              'A fórmula para o cálculo da relação é: (proteina ÷ creatinina)\n',
              style: TextStyle(fontSize: 24, color: Colors.green),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Valores de referência: \nRPC < 0,2 g/g: Valor normal. \nRPC entre 0,2 e 3,5 g/g: Proteinúria moderada; requer investigação adicional. \nRPC > 3,5 g/g: Proteinúria na faixa nefrótica; indica possível síndrome nefrótica .',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 248, 7, 7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
