import 'dart:html';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

  class BytebankApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ListaTransferencia(),
      );
    }
  }

class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _ControladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando Transferencia!'),
      ),
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
            Editor(
              controlador: _ControladorCampoNumeroConta,
              rotulo: "Valor da Transferencia",
              dica: "0000",
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: "Valor",
              dica: "0.00",
              icone: Icons.monetization_on
            ),
          ElevatedButton(
            onPressed: () =>_criaTransferencia(context, _ControladorCampoNumeroConta, _controladorCampoValor),
            child: Text('Confirmar'),
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
    debugPrint('$transferenciaCriada');
    debugPrint('me too');
    Navigator.pop(context, transferenciaCriada);
  }
}

class Editor extends StatelessWidget{

  final TextEditingController ?controlador;
  final String ?rotulo;
  final String ?dica;
  final IconData ?icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context){
    return Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controlador,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                icon: icone != null ? Icon(icone) : null,
                labelText: rotulo,
                hintText: dica,
              ),
              keyboardType: TextInputType.number,
            ),
          );
  }
}

  class ListaTransferencia extends StatefulWidget {
    final List<Transferencia> _transferencias = [];

    @override
    State<StatefulWidget> createState(){
      return ListaTransferenciaState();
    }
  }

  class ListaTransferenciaState extends State<ListaTransferencia>{
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: const Text('Transferencias'),
        ),
        body: ListView.builder(
          itemCount: widget._transferencias.length,
          itemBuilder: (context, indice) {
            final transferencia = widget._transferencias[indice];
            return ItemTransferencia(transferencia);
          },
        ),
        floatingActionButton: 
          FloatingActionButton(
            onPressed: () {
                final Future<Transferencia?> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FormularioTransferencia();
                  }
                )
              );
              future.then((transferenciaRecebida) => {
                Future.delayed(Duration(seconds: 5), () {
                  if(transferenciaRecebida != null)
                    setState(() {
                      widget._transferencias.add(transferenciaRecebida);
                  });
                })
              });
            }, 
            child: Icon(Icons.add),
          ),
      );
    }
  }

  class ItemTransferencia extends StatelessWidget {

    final Transferencia _transferencia;

    ItemTransferencia(this._transferencia);

    @override
    Widget build(BuildContext context){
      return Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text(_transferencia.valor.toString()),
            subtitle: Text(_transferencia.numeroConta.toString()),
          ),
        );
    }
  }

  class Transferencia{
    final double valor;
    final int numeroConta;

    Transferencia(this.valor, this.numeroConta);

    @override
    String toString() {
      return 'Transferencia{ valor: $valor, numeroConta: $numeroConta}';
    }
  }

