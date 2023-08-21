import 'package:flutter/material.dart';

class Item {
  Image? image;
  String? description;
  final double price;

  Item({this.image, this.description, required this.price});
}
