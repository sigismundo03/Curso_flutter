import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questonario extends StatelessWidget {
  final List<Map<String,Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() responder;

  const Questonario({
    @required this.perguntas,
    @required this.perguntaSelecionada, 
    @required this.responder,
    });

   bool get temPerguntaSelecionada {
      return perguntaSelecionada < perguntas.length;
    
   }

  @override
  Widget build(BuildContext context) {
      List <String> respostas = temPerguntaSelecionada 
    ? perguntas[perguntaSelecionada]['respostas'] : null;

    return Column(
          children: <Widget>[
            Questao(perguntas[perguntaSelecionada]['texto']),
            ...respostas.map((f) => Resposta(f,responder)).toList(),
          ],
          );
  }
}