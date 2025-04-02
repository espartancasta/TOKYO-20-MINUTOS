import 'package:flutter/material.dart';
import 'package:flutter_aplication_1/Theme/colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Texto
            Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(width: 10),
            // Icono
            const Icon(Icons.arrow_forward, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
