import 'package:flutter/material.dart';
import 'package:gym/widgets/login.dart';



final ThemeData ogmaTheme = ThemeData(
  primaryColor: const Color.fromARGB(255, 0, 0, 0), // Cambia el color principal como desees
  hintColor: const Color.fromARGB(255, 226, 230, 2), // Cambia el color de acento como desees
  textTheme: const TextTheme(
    labelLarge: TextStyle(fontSize: 16.0, color: Colors.white), // Cambia el estilo del texto de los botones
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(), // Cambia el estilo del borde de los campos de texto
    labelStyle: TextStyle(color: Colors.grey), // Cambia el estilo del texto de la etiqueta
  ),
);


void main() => runApp(const OgmaTrainer());

class OgmaTrainer extends StatelessWidget {
  const OgmaTrainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ogmaTheme,
      home: Login() // Se usa como la pagina de inicio
    );
  }
}
