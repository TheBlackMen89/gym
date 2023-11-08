import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym/widgets/login.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: SvgPicture.asset(
          'assets/ogma.svg',
         // color: Colors.blue,
          width: 550,
          height: 250,
        ),
        //title: const Text('Mi Aplicación'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search), // Botón de búsqueda
            onPressed: () {
              // Lógica de búsqueda
            },
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              SystemNavigator.pop();
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
            },
          ),
        ],
      ),
      body: Center(
        child: FadeInRightBig(
        child: const Text('Contenido de la página principal'),
      ),
      ),
    );
  }
}