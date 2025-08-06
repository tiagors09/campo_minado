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
    if (campo.aberto && campo.minado && campo.explodido) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }
}
