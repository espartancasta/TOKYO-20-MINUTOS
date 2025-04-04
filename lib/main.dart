import 'package:flutter/material.dart';
import 'package:flutter_aplication_1/cart_page.dart';
import 'package:flutter_aplication_1/components/models/shop.dart';
import 'package:flutter_aplication_1/intro_page.dart';
import 'package:flutter_aplication_1/menu_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => const MenuPage(),
        '/cartpage': (context) => const CartPage(),
      },
    );
  }
}
