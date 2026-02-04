import 'package:flutter/material.dart';
import 'dart:math';


class DetailPage extends StatelessWidget {
  
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int randomStudents;

     randomStudents = Random().nextInt(29001) + 1000;

    final String nombreUniversidad =
        ModalRoute.of(context)!.settings.arguments as String;

    return MaterialApp(
      title: 'Universidades App',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(nombreUniversidad),
        ),
        body: Center(
            child: Column(
              children: [
                Image.network(
                "https://images.unsplash.com/photo-1541339907198-e08756dedf3f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80", 
                height: 400, 
                width: 400),
                const SizedBox(height: 10),
                Container(
                          child: Text("Número de estudiantes : $randomStudents"),
                        ),
              ],
            )),
      ),
    );
  }
}
