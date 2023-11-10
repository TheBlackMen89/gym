import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym/widgets/imagen.dart';
import 'package:gym/widgets/login.dart';
import 'package:gym/widgets/popup.dart';

class Principal extends StatelessWidget {
  final String? uid;
  Principal({this.uid});

  final List<String> listaDeImagenes = [
    'assets/maquinas/maquina1.png',
    'assets/maquinas/maquina2.png',
    'assets/maquinas/maquina3.png',
    'assets/maquinas/maquina4.png',
    'assets/maquinas/maquina5.png',
    'assets/maquinas/maquina6.png',
    'assets/maquinas/maquina7.png',
    'assets/maquinas/maquina8.png',
    'assets/maquinas/maquina9.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 200,
        leading: SvgPicture.asset(
          'assets/logos/ogma (3).svg',
          // ignore: deprecated_member_use
          color: const Color.fromARGB(255, 0, 0, 0),
          width: 700,
          height: 300,
        ),
        actions: <Widget>[
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
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Center(
            child: FadeInRightBig(
              child: Column(
                children: [
                  const Pic(size: 150, asset: 'assets/users/yo.jpg'),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the "Camara" screen when the button is pressed
                      Camara.opciones(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      fixedSize: const Size(60, 40),
                    ),
                    child: const Icon(Icons.camera, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
          ),
          //const SizedBox(height: 20.0),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Container(
                    width: 500,
                    height: 50.0,
                    color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(Icons.sports_gymnastics,
                            color: Colors.white),
                        const Padding(
                          padding: EdgeInsets.only(right: 5.0),
                        ),
                        Text(
                          index.toString(),
                          style: const TextStyle(
                              fontSize: 20.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 500,
                    child: GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 1.2,
                      children: List.generate(
                        listaDeImagenes.length,
                        (index) {
                          return InkWell(
                            onTap: () {
                              // Logica al tocar el Card
                            },
                            splashColor:
                                Colors.grey, // Color del realce al tocar
                            highlightColor: Colors.transparent,
                            child: Card(
                              color: Colors.white,
                              child: Image.asset(
                                listaDeImagenes[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Principal()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.calendar_month_outlined),
              color: Colors.black,
              onPressed: () {
                // Navegar a la página de búsqueda
              },
            ),
            IconButton(
              icon: const Icon(Icons.sports_gymnastics),
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
