// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class Maquina extends StatefulWidget {
  final String nombre;
  final String imagenUrl;

  const Maquina({
    Key? key, // Agrega un parámetro de clave si lo necesitas
    required this.nombre,
    required this.imagenUrl,
  }) : super(key: key);

  @override
  _MaquinaState createState() => _MaquinaState();
}

class _MaquinaState extends State<Maquina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nombre),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              widget.imagenUrl,
              width: 100,
              height: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Nombre: ${widget.nombre}',
              style: TextStyle(fontSize: 18),
            ),
            // Puedes agregar más widgets aquí según tus necesidades
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Puedes manejar eventos, como hacer que la máquina realice una acción
          // al presionar el botón flotante
        },
        tooltip: 'Realizar acción',
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
