import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:gym/widgets/principal.dart';

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255,
            255), // Cambia el color de fondo de la página de inicio de sesión
        child: Center(
          child: FadeInDownBig(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/ogma.png'),
                  const SizedBox(height: 40.0),
                  Title(
                      color: Colors.white,
                      child: const Text('Bienvenidos',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ))),
                  const SizedBox(height: 40.0),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Correo electrónico...',
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Contraseña...',
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {
                      final email = emailController.text;
                      final password = passwordController.text;

                      // Validar el inicio de sesión (por ejemplo, usando credenciales predefinidas)
                      if (email == 'admin' && password == '123') {
                        // Navega a la página de inicio (HomePage)
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => principal()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 243, 88, 22),
                        fixedSize: const Size(180, 30)),
                    child: const Text('Iniciar sesión'),
                  ),
                  const SizedBox(height: 15.0),
                  TextButton(
                    onPressed: () {
                      final email = emailController.text;
                      final password = passwordController.text;

                      // Validar el inicio de sesión (por ejemplo, usando credenciales predefinidas)
                      if (email == 'admin' && password == '123') {
                        // Navega a la página de inicio (HomePage)
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => principal()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 253, 254, 255),
                        fixedSize: const Size(180, 30)),
                    child: const Text(
                      'Registrate',
                      style: TextStyle(
                        color: Colors.black,
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
