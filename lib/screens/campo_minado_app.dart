import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/components/resultado_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  const CampoMinadoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final campo = Campo(
      linha: 0,
      coluna: 0,
    );

    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: true,
          quandoReiniciar: _reiniciar,
        ),
        body: Container(
          child: CampoWidget(
            campo: campo,
            quandoAbrir: _abrir,
            quandoAlternarMarcacao: _alternarMarcacao,
          ),
        ),
      ),
    );
  }

  void _reiniciar() {
    print('reiniciar');
  }

  void _abrir(Campo c) {
    print('abrindo');
  }

  void _alternarMarcacao(Campo c) {
    print('abrindo marcação');
  }
}
