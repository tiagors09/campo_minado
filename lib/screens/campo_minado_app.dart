import 'dart:math';

import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/components/resultado_widget.dart';
import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/exceptions/explosao_exception.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatefulWidget {
  const CampoMinadoApp({super.key});

  @override
  State<CampoMinadoApp> createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool? _venceu;
  Tabuleiro? _tabuleiro;

  Tabuleiro _getTabuleiro(double largura, double altura) {
    if (_tabuleiro == null) {
      int qtdColunas = 15;
      double tamanhoCampo = largura / qtdColunas;
      int qtdLinhas = (altura / tamanhoCampo).floor();

      _tabuleiro = Tabuleiro(
        linhas: qtdLinhas,
        colunas: qtdColunas,
        qtdBombas: Random().nextInt(5),
      );
    }

    return _tabuleiro!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: _venceu,
          quandoReiniciar: _reiniciar,
        ),
        body: Container(
          child: LayoutBuilder(
            builder: (ctx, cts) {
              return TabuleiroWidget(
                tabuleiro: _getTabuleiro(cts.maxWidth, cts.maxWidth),
                abrir: _abrir,
                alterarMarcacao: _alternarMarcacao,
              );
            },
          ),
        ),
      ),
    );
  }

  void _reiniciar() {
    setState(() {
      _venceu = null;
      _tabuleiro!.reiniciar();
    });
  }

  void _abrir(Campo c) {
    if (_venceu != null) {
      return;
    }

    setState(
      () {
        try {
          c.abrir();
          if (_tabuleiro!.resolvido) {
            _venceu = true;
          }
        } on ExplosaoException {
          _venceu = false;
          _tabuleiro!.revelarBombas();
        }
      },
    );
  }

  void _alternarMarcacao(Campo c) {
    if (_venceu != null) {
      return;
    }

    setState(() {
      c.alternarMarcacao();
      if (_tabuleiro!.resolvido) {
        _venceu = true;
      }
    });
  }
}
