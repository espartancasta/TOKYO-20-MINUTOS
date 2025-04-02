import 'package:flutter/material.dart';
import 'package:flutter_aplication_1/components/Models/food.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  const FoodTile({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(left: 25),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // image
          Image.asset(
            food.imagePath,
            height: 140,
          ), // Image.asset

          // text
          Text(
            food.name,
            style: GoogleFonts.dmSerifDisplay(fontSize: 20),
          ), // Text

          const SizedBox(height: 10), // Agregado para separación

          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${food.price}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                const Icon(Icons.star, color: Colors.yellow),
                Text(
                  food.rating,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
