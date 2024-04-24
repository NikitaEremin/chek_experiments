
import 'package:flutter/material.dart';

class Product {
  String name;
  double price;
  Image image;
  String? gtin;

  Product({required this.name, required this.price, required this.image, this.gtin});
}