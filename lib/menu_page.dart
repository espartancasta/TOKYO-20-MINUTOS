import 'package:flutter/material.dart';
import 'package:flutter_aplication_1/Theme/colors.dart'; // ✅ Importa colores
import 'package:flutter_aplication_1/components/Models/food.dart';
import 'package:flutter_aplication_1/components/button.dart'; // ✅ Importa botón
import 'package:flutter_aplication_1/components/food_tile.dart';
import 'package:google_fonts/google_fonts.dart'; // ✅ Importa GoogleFonts

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // food menu
  List foodMenu = [
    //salmon sushi
    Food(
      name: "Salmon Sushi",
      price: "21.00",
      imagePath: "lib/images/salmon_sushi.png",
      rating: "4.9",
    ),

    Food(
      name: "Tuna",
      price: "23.00",
      imagePath: "lib/images/tuna.png",
      rating: "4.3",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 10,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor, // ✅ Usa el color de colors.dart
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ✅ Corregí la sintaxis y anidé correctamente
              children: [
                Column(
                  // ✅ Estructura anidada correctamente
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Promo message
                    Text(
                      'Get 32% Promo',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Redeem button
                    MyButton(
                      text: "Redeem",
                      onTap: () {},
                    ),
                  ],
                ),

                // IMAGE OF THE PROMO
                Image.asset(
                  'lib/images/many_sushi.png',
                  height: 120,
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Search here...."),
            ),
          ),

          const SizedBox(height: 25),

          // menu List
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Food Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(food: foodMenu[index]),
            ),
          ),

          const SizedBox(height: 25),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'lib/images/salmon_eggs.png',
                      height: 60,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Salmon Eggs",
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '\$21.00',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
