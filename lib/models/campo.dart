import 'package:campo_minado/models/explosao_exception.dart';

class Campo {
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];

  bool _aberto = false;
  // ignore: unused_field, prefer_final_fields
  bool _marcado = false;
  // ignore: unused_field, prefer_final_fields
  bool _explodido = false;
  bool _minado = false;

  Campo({required this.linha, required this.coluna});

  void adicionarVizinho(Campo vizinho) {
    final deltaLinha = (linha - vizinho.linha).abs();
    final deltaColuna = (coluna - vizinho.coluna).abs();

    if (deltaLinha == 0 && deltaColuna == 0) return;

    if (deltaLinha <= 1 && deltaColuna <= 1) vizinhos.add(vizinho);
  }

  void abrir() {
    if (_aberto) return;

    _aberto = true;

    if (_minado) {
      _explodido = true;
      throw ExplosaoException();
    }

    if (vizinhancaSegura) {
      for (var v in vizinhos) {
        v.abrir();
      }
    }
  }

  void revelarBomba() {
    if (_minado) {
      _aberto = true;
    }
  }

  void minar() {
    _minado = true;
  }

  void alternarMarcacao() {
    _marcado = !_marcado;
  }

  void reiniciar() {
    _aberto = false;
    _marcado = false;
    _explodido = false;
    _minado = false;
  }

  bool get minado => _minado;
  bool get explodido => _explodido;
  bool get marcado => _marcado;
  bool get aberto => _aberto;

  bool get resolvido {
    bool minadoEMarcado = _minado && _marcado;
    bool seguroEAberto = !_minado && _aberto;

    return minadoEMarcado || seguroEAberto;
  }

  bool get vizinhancaSegura => vizinhos.every((v) => !v._minado);

  int get qtdMinasNaVizinhanca => vizinhos.where((v) => v.minado).length;
}
