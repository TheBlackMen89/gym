import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym/widgets/imagen.dart';
import 'package:gym/widgets/login.dart';
import 'package:gym/widgets/popup.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 200,
        leading: SvgPicture.asset(
          'assets/logos/ogma (3).svg',
          // ignore: deprecated_member_use
          color: const Color.fromARGB(255, 0, 0, 0),
          width: 700,
          height: 300,
        ),
        //backgroundColor: Colors.transparent,
        //title: const Text('Mi Aplicación'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.black, // Botón de búsqueda
            onPressed: () {
              // Lógica de búsqueda
            },
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            color: Colors.black,
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
      body: SizedBox(
        width: 450,
        child: Center(
          child: FadeInRightBig(
            child: Column(
              children: [
                const Pic(size: 200, asset: 'assets/users/yo.jpg'),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navega a la pantalla "Camara" al presionar el botón
                    Camara.opciones(context);
                  },
                  style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                        fixedSize: const Size(60, 40)),
                  child: const Icon(Icons.camera, color: Colors.black,),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Principal()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.add_card),
              color: Colors.black,
              onPressed: () {
                // Navegar a la página de búsqueda
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              color: Colors.black,
              onPressed: () {
                // Navegar a la página de notificaciones
              },
            ),
            IconButton(
              icon: const Icon(Icons.mail),
              color: Colors.black,
              onPressed: () {
                // Navegar a la página de mensajes
              },
            ),
          ],
        ),
      ),
    );
  }
}
