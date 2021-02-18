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
  Coffee(coffeeIcon: MyFlutterApp.cup, name: "Espresso", price: 500),
  Coffee(coffeeIcon: MyFlutterApp.beer, name: "Cappuccino", price: 600),
  Coffee(coffeeIcon: FontAwesomeIcons.coffee, name: "Mocha", price: 150),
  Coffee(coffeeIcon: MyFlutterApp.beer, name: "Americano", price: 600),
  Coffee(coffeeIcon: MyFlutterApp.coffee_cup, name: "Macchiato", price: 350),
  Coffee(coffeeIcon: FontAwesomeIcons.coffee, name: "Flat White", price: 150),
  Coffee(coffeeIcon: MyFlutterApp.coffee_mug, name: "Affogato", price: 150),
  Coffee(coffeeIcon: FontAwesomeIcons.coffee, name: "Long Black", price: 150),
  Coffee(coffeeIcon: MyFlutterApp.coffee_mug, name: "Latte", price: 150),
];
