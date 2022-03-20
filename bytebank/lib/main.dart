import 'dart:html';
import 'package:bytebank/screens/lista_transferencia.dart';
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


