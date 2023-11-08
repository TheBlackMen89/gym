import 'package:flutter/material.dart';

class Camara extends StatelessWidget {
  const Camara({super.key});

  // Define el método opciones como estático
  static void opciones(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    //selImagen(1);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey)),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Tomar una foto',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // selImagen(2);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey)),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Seleccionar una foto',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Icon(
                          Icons.image,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey)),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Cancelar',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Icon(
                          Icons.cancel,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selecciona imagen"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Llama al método opciones desde el botón
                    opciones(context);
                  },
                  child: const Text('Selecciona una imágen'),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Center(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
