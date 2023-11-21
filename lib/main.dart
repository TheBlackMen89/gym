import 'package:firebase_core/firebase_core.dart';
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


void main() async{ 
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyBZDBrtA8JkilnBctW4Lncps07CqDmbMcI",
        authDomain: "gym-flutter-u.firebaseapp.com",
        projectId: "gym-flutter-u",
        storageBucket: "gym-flutter-u.appspot.com",
        databaseURL: 'https://gym-flutter-u-default-rtdb.firebaseio.com/',
        messagingSenderId: "917801962298",
        appId: "1:917801962298:web:5d1d8f34a43c6de652de03"
    ),
    );
    runApp(const OgmaTrainer());
  }

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
