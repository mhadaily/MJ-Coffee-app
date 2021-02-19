import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icons/my_flutter_app_icons.dart';
import 'models/coffee.dart';

Color darkBrown = Color(0xFFA26E47);
Color lightBrown = Color(0xFFF9E8D4);
Color brown = Color(0xFF9C5700);
Color facebookColor = Color(0xFF4867AA);

final List<Coffee> coffees = [
  Coffee(coffeeIcon: MyFlutterApp.cup, name: "Espresso", price: 8),
  Coffee(coffeeIcon: MyFlutterApp.beer, name: "Cappuccino", price: 10),
  Coffee(coffeeIcon: FontAwesomeIcons.coffee, name: "Mocha", price: 12),
  Coffee(coffeeIcon: MyFlutterApp.beer, name: "Americano", price: 7),
  Coffee(coffeeIcon: MyFlutterApp.coffee_cup, name: "Macchiato", price: 5),
  Coffee(coffeeIcon: FontAwesomeIcons.coffee, name: "Flat White", price: 3),
  Coffee(coffeeIcon: MyFlutterApp.coffee_mug, name: "Affogato", price: 11),
  Coffee(coffeeIcon: FontAwesomeIcons.coffee, name: "Long Black", price: 4),
  Coffee(coffeeIcon: MyFlutterApp.coffee_mug, name: "Latte", price: 12),
  Coffee(coffeeIcon: MyFlutterApp.cup, name: "Espresso", price: 8),
  Coffee(coffeeIcon: MyFlutterApp.beer, name: "Cappuccino", price: 10),
  Coffee(coffeeIcon: FontAwesomeIcons.coffee, name: "Mocha", price: 12),
  Coffee(coffeeIcon: MyFlutterApp.beer, name: "Americano", price: 7),
  Coffee(coffeeIcon: MyFlutterApp.coffee_cup, name: "Macchiato", price: 5),
  Coffee(coffeeIcon: FontAwesomeIcons.coffee, name: "Flat White", price: 3),
  Coffee(coffeeIcon: MyFlutterApp.coffee_mug, name: "Affogato", price: 11),
  Coffee(coffeeIcon: FontAwesomeIcons.coffee, name: "Long Black", price: 4),
  Coffee(coffeeIcon: MyFlutterApp.coffee_mug, name: "Latte", price: 12),
];
