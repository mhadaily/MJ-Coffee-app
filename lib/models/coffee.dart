import 'package:flutter/material.dart';

class Coffee {
  const Coffee({
    this.coffeeIcon,
    this.name,
    this.price,
  });

  final IconData coffeeIcon;
  final String name;
  final int price;
}
