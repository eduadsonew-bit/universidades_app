
 import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universidades App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Nombre de la Universidad'),
        ),
        body:  Center(
          child:  Container(
            child: const Text("Número de estudiantes : "),
          )
        ),
      ),
    );
  }
}


  


