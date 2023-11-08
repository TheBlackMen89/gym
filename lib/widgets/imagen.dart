import 'package:flutter/material.dart';

class Pic extends StatelessWidget {
  final double size;
  final String asset;
  final double borde;
  const Pic({
    Key? key,
    required this.size,
    required this.asset,
    this.borde = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
          width: borde,
          color: Colors.white,
        ),
        image: DecorationImage(
          image: AssetImage(asset),
        ),
      ),
    );
  }
}
