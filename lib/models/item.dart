import 'package:flutter/material.dart';

class Item {
  Image? image;
  final String description;
  final double price;

  Item({required this.description, required this.price, this.image});
}
