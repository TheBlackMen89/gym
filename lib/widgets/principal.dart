import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym/widgets/cicleButton.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 150,
        
        actions: const [
          CircleButton(
            color: Colors.white,
            iconData: Icons.close,
            coloricon: Colors.blue,
            showBadge: true,
          ),
          SizedBox(width: 15),
          CircleButton(
            color: Colors.white,
            iconData: Icons.notification_add,
            coloricon: Colors.blue,
            showBadge: true,
          ),
        ],
        //title: const Text('Bienvendidos a tu Gym'),
      ),
      body: const Center(
        child: Text('¡Bienvendidos a tu Gym!'),
      ),
    );
  }
}
