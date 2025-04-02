import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // ✅ Importa colores

import 'package:flutter_aplication_1/components/button.dart';

import 'Theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            const Color(0xFFFFFFFF), // Fondo blanco con sintaxis correcta
        appBar: AppBar(
          // Añadí la coma faltante y corregí la sintaxis
          backgroundColor: primaryColor,
          elevation: 10,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 25),
              //shop Name,
              Text("TOKYO SUSHI",
                  style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28, color: Colors.black)),

              const SizedBox(height: 25),
              //Icon
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "lib/images/Sushi_principal.png",
                    height: 180,
                  )),

              const SizedBox(height: 25),
              //subtitle
              Text("SUSHI Y COMIDA JAPONESA",
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 38,
                    color: Colors.black,
                  )),

              const SizedBox(height: 12),
              //subtitle
              Text(
                "Una experiencia grata del buen sabor del sushi y la comida japonesa ",
                style: TextStyle(
                  color: Colors.black,
                  height: 2,
                ),
              ),

              const SizedBox(height: 25),
              //get started button

              MyButton(
                text: "Get Started",
                onTap: () {
                  Navigator.pushNamed(context, '/menupage');
                },
              )
            ],
          ),
        ));
  }
}
