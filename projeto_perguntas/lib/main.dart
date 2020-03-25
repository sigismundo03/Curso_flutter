import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int perguntaSelecionada = 0;
  int pontuacaototal = 0;

  final List<Map<String, Object>> perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto':'Preto','pontuacao':10},
        {'texto':'Vermelho','pontuacao':5},
        {'texto':'Verde','pontuacao':3},
        {'texto':'Branco','pontuacao':1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho','pontuacao':10},
        {'texto': 'Cobra','pontuacao':5},
        {'texto': 'Elefante','pontuacao':3},
        {'texto': 'Leão','pontuacao':20,}
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto':'Maria','pontuacao':10},
        {'texto':'João','pontuacao':5},
        {'texto':'Leo','pontuacao':3},
        {'texto':'Pedro','pontuacao':1},
      ],
    }
  ];

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  void responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        pontuacaototal+= pontuacao;

        perguntaSelecionada++;
      });
    }
  }
  void reniciarQuestonario(){
    setState(() {
        pontuacaototal= 0;

        perguntaSelecionada=0;
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: perguntas,
                perguntaSelecionada: perguntaSelecionada,
                responder: responder)
            : Resultado(pontuacaototal,reniciarQuestonario),
      ),
    );
  }
}
