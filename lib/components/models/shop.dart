import 'package:flutter/material.dart';
import 'package:flutter_aplication_1/components/models/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> foodMenu = [
    Food(
      name: "Salmon Sushi",
      price: 21.00,
      imagePath: "lib/images/salmon_sushi.png",
      rating: "4.9",
    ),
    Food(
      name: "Tuna",
      price: 23.00,
      imagePath: "lib/images/tuna.png",
      rating: "4.3",
    ),
  ];

  final List<Food> _cart = [];

  List<Food> get cart => _cart;

  // ✅ Add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners(); // ✅ Esto sí lo tienes bien
  }

  // ✅ FIXED: Remove from cart ahora notifica correctamente
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners(); // ✅ Aquí estaba el problema
  }
}
