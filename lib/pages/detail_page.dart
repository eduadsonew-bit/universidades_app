import 'dart:math';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final String nombreUniversidad = ModalRoute.of(context)!.settings.arguments as String;
    
    final int randomStudents = Random().nextInt(29001) + 1000;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          nombreUniversidad,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagen
            Image.network(
              "https://images.unsplash.com/photo-1541339907198-e08756dedf3f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80",
              height: 400,
              width: 400,
            ),
            
            const SizedBox(height: 10),
            
            Text(
              "Número de estudiantes : $randomStudents",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ], 
        ), 
      ), 
    ); 
  }
}




