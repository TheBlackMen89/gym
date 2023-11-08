import 'package:flutter/material.dart';
import 'package:gym/widgets/login.dart';
import 'package:animate_do/animate_do.dart';

class Registro extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Registro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        //width: 400,
        child: Center(
          child: FadeInRightBig(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/logos/ogma.png'),
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
                      child: const Text('Usuario',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ))),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 300,
                  child: TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Usuario...',
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
                      //final username = usernameController;
                      //final email = emailController.text;
                      //final password = passwordController.text;

                      //logica para guardar en la bd

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 243, 144, 22),
                        fixedSize: const Size(180, 30)),
                    child: const Text('Resgistrar'),
                  ),
                  const SizedBox(height: 15.0),
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
                        fixedSize: const Size(180, 30)),
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
}
