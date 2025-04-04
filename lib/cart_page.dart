import 'package:flutter/material.dart';
import 'package:flutter_aplication_1/Theme/colors.dart';
import 'package:flutter_aplication_1/components/models/food.dart'; // ✅ correcto
import 'package:flutter_aplication_1/components/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // Corregido: ahora recibe correctamente los parámetros
  void removeFromCart(BuildContext context, Food food) {
    final shop = context.read<Shop>();
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text("My Cart"),
          backgroundColor: primaryColor,
        ),
        body: value.cart.isEmpty
            ? const Center(
                child: Text(
                  "Tu carrito está vacío 😢",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  // Obtener el alimento del carrito
                  final Food food = value.cart[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Image.asset(food.imagePath, width: 50),
                      title: Text(
                        food.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text("\$${food.price.toStringAsFixed(2)}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => removeFromCart(context, food),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
