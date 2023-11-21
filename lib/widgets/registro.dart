import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gym/widgets/login.dart';
import 'package:animate_do/animate_do.dart';
import 'principal.dart';

// ignore: must_be_immutable
class Registro extends StatelessWidget {
 
  final formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef = FirebaseDatabase.instance.ref().child("clientes");
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Registro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: FadeInRightBig(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/logos/ogma.png', width: 400,),
                  const SizedBox(height: 20.0),
                  Title(
                      color: Colors.white,
                      child: const Text('Registrate',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ))),
                  const SizedBox(height: 25.0),
                  Title(
                      color: Colors.white,
                      child: const Text('Nombres',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ))),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 300,
                  child: TextField(
                    controller: firstNameController,
                    decoration: const InputDecoration(
                      labelText: 'Nombres...',
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  ),
                  const SizedBox(height: 20.0),
                  Title(
                      color: Colors.white,
                      child: const Text('Apellidos',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ))),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 300,
                  child: TextField(
                    controller: lastNameController,
                    decoration: const InputDecoration(
                      labelText: 'Apellidos...',
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  ),
                  const SizedBox(height: 20.0),
                  Title(
                      color: Colors.white,
                      child: const Text('Edad',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ))),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 300,
                  child: TextField(
                    controller: ageController,
                    decoration: const InputDecoration(
                      labelText: 'Edad...',
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  ),
                  const SizedBox(height: 20.0),
                  Title(
                      color: Colors.white,
                      child: const Text('Correo Electronico',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ))),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 300,
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Correo electrónico...',
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  ),
                  const SizedBox(height: 20.0),
                  Title(
                      color: Colors.white,
                      child: const Text('Contraseña',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ))),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 300,
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Contraseña...',
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    obscureText: true,
                  ),
                  ),
                  const SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {
                      //GUARDAR EN FIREBASE AUTHENTICATION Y FIREBASE REAL TIME DATABASE                      
                      registerToFb(context);                      
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 243, 144, 22),
                        fixedSize: const Size(180, 20)),
                    child: const Text('Resgistrar'),
                  ),
                  const SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                        fixedSize: const Size(180, 20)),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(
                        color: Color.fromARGB(255, 246, 245, 245),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    
  }
void registerToFb(BuildContext context) {
    firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      dbRef.child(result.user!.uid).set({
        "correo": emailController.text,
        "edad": ageController.text,
        "nombres": firstNameController.text,
        "apellidos": lastNameController.text,
        "id_user": "1000618718"
      }).then((res) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Principal(uid: result.user!.uid)),
        );
      });
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }
  
}
