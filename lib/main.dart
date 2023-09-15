import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/item_list_controller.dart';
import 'screens/home_page.dart';

void main() {
  ItemListController.getOrPut;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Stockit',
      theme: ThemeData(
        colorSchemeSeed: const Color(0x9f4376f8),
        textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.white)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
