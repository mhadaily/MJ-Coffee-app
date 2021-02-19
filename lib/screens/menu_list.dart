import 'package:flutter/material.dart';

import '../coffee_router.dart';
import '../const.dart' hide coffees;
import './menu_detail.dart';
import '../models/coffee.dart';

class MenuList extends StatelessWidget {
  const MenuList({
    @required this.coffees,
  }) : assert(coffees != null);

  final List<Coffee> coffees;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(height: 1, color: Colors.grey.shade400);
      },
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: coffees.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ListTile(
            contentPadding: EdgeInsets.all(15),
            title: Text(
              coffees[index].name,
              style: Theme.of(context).textTheme.headline5,
            ),
            leading: Icon(coffees[index].coffeeIcon, size: 40, color: brown),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          onTap: () {
            CoffeeRouter.instance.push(
              MenuDetails.route(coffee: coffees[index]),
            );
          },
        );
      },
    );
  }
}
