import 'package:campo_minado/components/resultado_widget.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  const CampoMinadoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: true,
          quandoReiniciar: _reiniciar,
        ),
        body: Container(
          child: Text('Campo Minado'),
        ),
      ),
    );
  }

  void _reiniciar() {
    print('reiniciar');
  }
}
