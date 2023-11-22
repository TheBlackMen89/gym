import 'package:flutter/material.dart';
//import 'package:cached_network_image/cached_network_image.dart';


class Routine extends StatelessWidget {
  // Datos de rutinas
  final List<Map<String, dynamic>> routines = [
    {
      'name': 'Saltos de Tijera',
      'imagePath': 'assets/rutinas/SaltoTijera.jpg',
      'icon1': Icons.timer,
      'text1': '10 min',
      'icon2': Icons.favorite,
      'text2': '30 reps',
    },
    {
      'name': 'Flexiones con inclinacion (Apoyo de Brazos)',
      'imagePath': 'assets/rutinas/FlexionInclinacionBrazos.jpg',
      'icon1': Icons.timer,
      'text1': '10 min',
      'icon2': Icons.favorite,
      'text2': '20 reps',
    },
    {
      'name': 'Flexiones con apoyo de rodillas',
      'imagePath': 'assets/rutinas/flexionesApoyoRodillas.png',
      'icon1': Icons.timer,
      'text1': '10 min',
      'icon2': Icons.favorite,
      'text2': '15 reps',
    },
    {
      'name': 'Flexiones',
      'imagePath': 'assets/rutinas/flexiones.png',
      'icon1': Icons.timer,
      'text1': '10 min',
      'icon2': Icons.favorite,
      'text2': '15 reps',
    },
    {
      'name': 'Flexiones con brazos abiertos',
      'imagePath': 'assets/rutinas/flexionesBrazosAbiertos.png',
      'icon1': Icons.timer,
      'text1': '10 min',
      'icon2': Icons.favorite,
      'text2': '15 reps',
    },
    {
      'name': 'Estiramiento de cobra',
      'imagePath': 'assets/rutinas/estiramientoCobra.png',
      'icon1': Icons.timer,
      'text1': '10 min',
      'icon2': Icons.favorite,
      'text2': '12 reps',
    },
    {
      'name': 'Estiramiento de Pecho',
      'imagePath': 'assets/rutinas/estiramientoPecho.png',
      'icon1': Icons.timer,
      'text1': '10 min',
      'icon2': Icons.favorite,
      'text2': '12 reps',
    },
    {
      'name': 'Plancha',
      'imagePath': 'assets/rutinas/plancha.png',
      'icon1': Icons.timer,
      'text1': '5 min',
      'icon2': Icons.favorite,
      'text2': '10 reps',
    },
    {
      'name': 'Abdominales',
      'imagePath': 'assets/rutinas/abdominales.png',
      'icon1': Icons.timer,
      'text1': '10 min',
      'icon2': Icons.favorite,
      'text2': '20 reps',
    },
    {
      'name': 'Sentadillas',
      'imagePath': 'assets/rutinas/sentadillas.jpg',
      'icon1': Icons.timer,
      'text1': '10 min',
      'icon2': Icons.favorite,
      'text2': '30 reps',
    },
    {
      'name': 'Peso muerto',
      'imagePath': 'assets/rutinas/pesoMuerto.png',
      'icon1': Icons.timer,
      'text1': '10 min',
      'icon2': Icons.favorite,
      'text2': '5 reps',
    },
    // Agrega más rutinas aquí si lo deseas
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rutinas'),
      ),
      body: ListView.builder(
        itemCount: routines.length,
        itemBuilder: (context, index) {
          return buildRoutineCard(context, routines[index]);
        },
      ),
    );
  }

  Widget buildRoutineCard(BuildContext context, Map<String, dynamic> routine) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            // IMAGE CONTAINER
            SizedBox(
              width: 100, 
              height: 100,
              child: Image.asset(
                routine['imagePath'],
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            // Separación entre imagen y nombre de la rutina
            SizedBox(width: 10), 
            // Nombre de la rutina al centro
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    routine['name'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8), 
                  // Separación entre nombre y detalles de la rutina
                  // Detalles de la rutina (iconos y texto)
                  Row(
                    children: [
                      Icon(routine['icon1']),
                      SizedBox(width: 4),
                      Text(routine['text1']),
                      SizedBox(width: 16),
                      Icon(routine['icon2']),
                      SizedBox(width: 4),
                      Text(routine['text2']),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
