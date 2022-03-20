import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/transferencia.dart';
import 'Formulario_transferencia.dart';

const _tituloAppBarLista = 'Transferencia';

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
          title: const Text(_tituloAppBarLista),
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

