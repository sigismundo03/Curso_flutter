import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String,Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  const Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada, 
    @required this.responder,
    });

   bool get temPerguntaSelecionada {
      return perguntaSelecionada < perguntas.length;
    
   }

  @override
  Widget build(BuildContext context) {
      List <Map<String,Object>> respostas = temPerguntaSelecionada 
    ? perguntas[perguntaSelecionada]['respostas'] : null;

    return Column(
          children: <Widget>[
            Questao(perguntas[perguntaSelecionada]['texto']),
            ...respostas.map((resp) => Resposta(resp['texto'],()=>responder(resp['pontuacao']))).toList(),
          ],
          );
  }
}