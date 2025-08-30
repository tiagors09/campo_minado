import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class TabuleiroWidget extends StatelessWidget {
  final Tabuleiro tabuleiro;
  final void Function(Campo) abrir;
  final void Function(Campo) alterarMarcacao;

  const TabuleiroWidget({
    super.key,
    required this.tabuleiro,
    required this.abrir,
    required this.alterarMarcacao,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: tabuleiro.colunas,
      children: tabuleiro.campos
          .map<CampoWidget>(
            (Campo c) => CampoWidget(
              campo: c,
              quandoAbrir: abrir,
              quandoAlternarMarcacao: alterarMarcacao,
            ),
          )
          .toList(),
    );
  }
}
