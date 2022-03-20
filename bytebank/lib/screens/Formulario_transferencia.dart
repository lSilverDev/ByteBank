import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/editor.dart';
import '../models/transferencia.dart';

const _tituloAppBar = 'Criando Transferencia!';

const _rotuloCampoNumeroConta = 'Numero da conta';
const _rotuloDicaCampoValor = '0000';

const _rotuloCampoValor = 'Valor';
const _rotuloDica = '0,00';

const _rotuloBotao = 'Confirmar';

class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _ControladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
            Editor(
              controlador: _ControladorCampoNumeroConta,
              rotulo: _rotuloCampoNumeroConta,
              dica: _rotuloDicaCampoValor,
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _rotuloDica,
              icone: Icons.monetization_on
            ),
          ElevatedButton(
            onPressed: () =>_criaTransferencia(context, _ControladorCampoNumeroConta, _controladorCampoValor),
            child: Text(_rotuloBotao),
          )
        ]
        ),
      )
    );
  }
}

void _criaTransferencia(BuildContext context, TextEditingController _NumeroConta, TextEditingController _CampoValor){
  final int? numeroConta = int.tryParse(_NumeroConta.text);
  final double? valor = double.tryParse(_CampoValor.text);

  if(numeroConta != null && valor != null){
    final transferenciaCriada = Transferencia(valor, numeroConta);
    Navigator.pop(context, transferenciaCriada);
  }
}
