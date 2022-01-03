import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
        appBar: AppBar(
          title: const Text('Transferencias'),
        ),
        body: ListaTransferencia(),
        floatingActionButton: 
          FloatingActionButton(
            onPressed: () {}, 
            child: Icon(Icons.add),
          ),
      ),
    ),
  );

  class ListaTransferencia extends StatelessWidget {
    @override
    Widget build(BuildContext context){
      return Column(
        children: [
          ItemTransferencia(Transferencia(100, 1000)),
        ],
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
  }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: MyStatefulWidget(),
//     );
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   int _count = 0;

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
