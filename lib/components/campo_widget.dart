import 'package:campo_minado/models/campo.dart';
import 'package:flutter/material.dart';

class CampoWidget extends StatelessWidget {
  final Campo campo;
  final void Function(Campo) quandoAbrir;
  final void Function(Campo) quandoAlternarMarcacao;

  const CampoWidget({
    super.key,
    required this.campo,
    required this.quandoAbrir,
    required this.quandoAlternarMarcacao,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => quandoAbrir(campo),
      onLongPress: () => quandoAlternarMarcacao(campo),
      child: _getImage(),
    );
  }

  Widget _getImage() {
    final qtdMinas = campo.qtdMinasNaVizinhanca;
    String caminhoImagem = 'assets/images/fechado.jpeg';

    if (campo.aberto && campo.minado && campo.explodido) {
      caminhoImagem = 'assets/images/bomba_0.jpeg';
    } else if (campo.aberto && campo.minado) {
      caminhoImagem = 'assets/images/bomba_1.jpeg';
    } else if (campo.aberto) {
      caminhoImagem = 'assets/images/aberto_$qtdMinas.jpeg';
    } else if (campo.aberto) {
      caminhoImagem = 'assets/images/aberto_$qtdMinas.jpeg';
    } else if (campo.marcado) {
      caminhoImagem = 'assets/images/bandeira.jpeg';
    }

    return Image.asset(
      caminhoImagem,
      fit: BoxFit.cover,
    );
  }
}
