import 'package:flutter/material.dart';
import 'package:flutter_aplication_1/Theme/colors.dart';
import 'package:flutter_aplication_1/components/button.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/Models/food.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;

  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
//quantity
  int quantityCount = 0;

//decrement Quantity.
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

//inccrement Quantity.
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

//Add to cart.
  void addToCart() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 9,
        foregroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          //listview of food Deatils
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(
              children: [
                //image
                Image.asset(
                  widget.food.imagePath,
                  height: 200,
                ),

                const SizedBox(height: 25),
                //rating
                Row(
                  children: [
                    //star icon
                    Icon(Icons.star, color: Colors.yellow),

                    const SizedBox(width: 5),

                    //RATING NUMBER
                    Text(widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),

                const SizedBox(height: 25),

                //food name
                Text(
                  widget.food.name,
                  style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                ),

                const SizedBox(height: 25),

                //descripion
                Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 25),
                Text(
                    "Delicado rollo de salmón fresco, sazonado perfectamente con nuestro increíble arroz, cubierto de una capa de ajonjolí tostado. Suave y jugoso en cada bocado, acompañado de una sutil nota cítrica que realza su sabor.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      height: 2,
                    ))
              ],
            ),
          )),

          //prince + queality + add to cart button
          Container(
              color: primaryColor,
              padding: EdgeInsets.all(25),
              child: Column(children: [
                //price + Quantity(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price.
                    Text(
                      "\$${widget.food.price}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),

                    //quantity.
                    Row(
                      children: [
                        //minus button,
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.remove, color: Colors.white),
                              onPressed: decrementQuantity,
                            )),

                        //quantity Counts,
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),

                        //Plus Button
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.add, color: Colors.white),
                              onPressed: incrementQuantity,
                            ))
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 25),

                //add to cart button
                MyButton(text: "Add To Cart", onTap: addToCart)
              ]))
        ],
      ),
    ); // Scaffold
  }
}
