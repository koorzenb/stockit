import 'package:flutter/material.dart';

class Item {
  final Image? image;
  final String? description;
  final double price;
  final int quantity;

  Item({
    this.image,
    this.description,
    required this.price,
    this.quantity = 1,
  });
}
