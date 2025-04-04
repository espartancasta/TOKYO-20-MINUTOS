import 'package:flutter/material.dart';
import 'package:flutter_aplication_1/components/button.dart';
import 'package:flutter_aplication_1/components/models/food.dart';
import 'package:flutter_aplication_1/components/models/shop.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;

  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantityCount = 1;

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantityCount > 1) quantityCount--;
    });
  }

  //add to Cart(),
  // add to cart
  void addToCart() {
    // only add to cart if there is something in the cart
    if (quantityCount > 0) {
      // get access to shop
      final shop = context.read<Shop>();

      // add to cart
      shop.addToCart(widget.food, quantityCount);

      // let the user know it was successful
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Successfully added to cart"),
          actions: [
            // okay button
            IconButton(
              onPressed: () {
                // pop once to remove dialog box
                Navigator.pop(context);
                // pop again to go previous screen
                Navigator.pop(context);
              },
              icon: const Icon(Icons.done),
            ), // IconButton
          ],
        ), // AlertDialog
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // Image
                Image.asset(
                  widget.food.imagePath,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 25),

                // Rating
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow[800]),
                    const SizedBox(width: 5),
                    Text(
                      widget.food.rating,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Food name
                Text(
                  widget.food.name,
                  style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                ),
                const SizedBox(height: 25),

                // "Description" label
                Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),

                // Actual description text
                Text(
                  "Delicately sliced, fresh Atlantic salmon drapes elegantly over a pillow of perfectly seasoned rice. Garnished with wasabi and pickled ginger.",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                    height: 1.8,
                  ),
                ),
              ],
            ),
          ),

          // Price + Quantity + Add to cart
          Container(
            color: Colors.orange, // Puedes cambiarlo por tu primaryColor
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Price
                    Text(
                      "\$${widget.food.price}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    // Quantity selector
                    Row(
                      children: [
                        // Minus button
                        IconButton(
                          icon: const Icon(Icons.remove, color: Colors.black),
                          onPressed: decrementQuantity,
                        ),

                        // Quantity count
                        Text(
                          quantityCount.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        // Plus button
                        IconButton(
                          icon: const Icon(Icons.add, color: Colors.black),
                          onPressed: incrementQuantity,
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Add to cart button
                MyButton(text: "Add to cart", onTap: addToCart)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
