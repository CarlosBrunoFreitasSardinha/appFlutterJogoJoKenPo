import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção Abaixo";

  void _opcaoSelecionada(String escolhaDoUsuario){
    var opcoes = ["pedra", "papel","tesoura"];
    var escolha = opcoes[Random().nextInt(opcoes.length)];

    switch(escolha){
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }
    //verificação ganhador
    if(
    (escolhaDoUsuario=="pedra"&& escolha=="tesoura")||
        (escolhaDoUsuario=="tesoura"&& escolha=="papel")||
        (escolhaDoUsuario=="papel"&& escolha=="pedra")
    )this._mensagem = "Parabéns você venceu, pois você escolheu $escolhaDoUsuario e o app escolheu $escolha";
    else if (escolhaDoUsuario == escolha)this._mensagem = "Empate, pois você escolheu $escolhaDoUsuario e o app escolheu $escolha";
    else this._mensagem = "Você Perdeu, pois você escolheu $escolhaDoUsuario e o app escolheu $escolha";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 36, bottom: 16),
            child: Text("Escolha do app",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
          ),

          Image(
            image: this._imagemApp,
          ),

          Padding(
            padding: EdgeInsets.only(top: 36, bottom: 16),
            child: Text(this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Image.asset("images/pedra.png", height: 110,),
                onTap: () => _opcaoSelecionada("pedra"),
              ),
              GestureDetector(
                child: Image.asset("images/papel.png", height: 110,),
                onTap: () => _opcaoSelecionada("papel"),
              ),
              GestureDetector(
                child: Image.asset("images/tesoura.png", height: 110,),
                onTap: () => _opcaoSelecionada("tesoura"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
