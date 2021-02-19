import 'package:flutter/material.dart';
import 'package:mjcoffee/shared/coffee_additions.dart';
import 'package:mjcoffee/shared/coffee_count.dart';
import 'package:mjcoffee/shared/coffee_size.dart';
import 'package:mjcoffee/shared/coffee_sugar.dart';

import '../models/coffee.dart';
import '../const.dart';

class MenuDetails extends StatefulWidget {
  const MenuDetails({this.coffee});

  static String routeName = 'loginScreen';
  static Route<MenuDetails> route({Coffee coffee}) {
    return MaterialPageRoute<MenuDetails>(
      settings: RouteSettings(name: routeName),
      builder: (BuildContext context) => MenuDetails(
        coffee: coffee,
      ),
    );
  }

  final Coffee coffee;

  @override
  _MenuDetailsState createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails> {
  int totalCount = 1;

  int get total {
    return totalCount * widget.coffee.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coffee.name),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            color: lightBrown,
            child: Icon(
              widget.coffee.coffeeIcon,
              size: 120,
              color: brown,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CoffeeCount(
                    price: widget.coffee.price,
                    notifyValue: (int count) {
                      setState(() {
                        totalCount = count;
                      });
                    },
                  ),
                  Divider(height: 3),
                  CoffeeSize(icon: widget.coffee.coffeeIcon),
                  Divider(height: 3),
                  CoffeeSugar(),
                  Divider(height: 3),
                  CoffeeAdditions(),
                  Divider(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total:",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        "USD $total",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: darkBrown),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Add to cart",
                    ),
                    color: darkBrown,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
