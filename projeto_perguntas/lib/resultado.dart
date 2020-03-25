import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int potuacao;
  final void Function() reneciarQuestonario;

  Resultado(this.potuacao, this.reneciarQuestonario);

  String get fraseResultado{
    
      String frase='';
        if(potuacao < 8){
          frase = 'parabens';
        }else if(potuacao < 12){
          frase ='voce é bom';
        }else if(potuacao < 16){
           frase = 'impressionade';
        }else{
           frase = 'nivel jedi';
        }
      return frase;
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
                child: Text(
                  fraseResultado,
                  style: TextStyle(fontSize: 22),
                  )
              ),
        FlatButton(
          onPressed: reneciarQuestonario, 
          child:Text(
            "Reineciar o questonario",
            style: TextStyle(fontSize: 20,color: Colors.blue),
            
            )
          
          )
      ],
    );
  }
}