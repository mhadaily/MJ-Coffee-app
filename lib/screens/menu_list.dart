import 'package:flutter/material.dart';

import '../coffee_router.dart';
import '../const.dart' hide coffees;
import './menu_detail.dart';
import '../models/coffee.dart';

class MenuList extends StatefulWidget {
  const MenuList({
    @required this.coffees,
  }) : assert(coffees != null);

  final List<Coffee> coffees;

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List<Coffee> _items = [];

  @override
  void initState() {
    super.initState();

    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: listKey,
      initialItemCount: _items.length,
      itemBuilder: (context, index, animation) {
        return slideIt(context, index, animation);
      },
    );
  }

  Future<void> _loadItems() async {
    for (Coffee item in widget.coffees) {
      await Future.delayed(Duration(milliseconds: 80));
      _items.add(item);
      listKey.currentState.insertItem(_items.length - 1);
    }
  }

  Widget slideIt(BuildContext context, int index, animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset(0, 0),
      ).animate(
        CurvedAnimation(
            parent: animation,
            curve: Curves.bounceIn,
            reverseCurve: Curves.bounceOut),
      ),
      child: GestureDetector(
        child: ListTile(
          contentPadding: EdgeInsets.all(15),
          title: Text(
            _items[index].name,
            style: Theme.of(context).textTheme.headline5,
          ),
          subtitle: Text(
            _makeSubtitle(index, widget.coffees[index].name),
            style: Theme.of(context).textTheme.subtitle2,
          ),
          leading: Icon(
            widget.coffees[index].coffeeIcon,
            size: 40,
            color: brown,
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        onTap: () {
          CoffeeRouter.instance.push(
            MenuDetails.route(coffee: _items[index]),
          );
        },
      ),
    );
  }

  int _blockingUI(int n) {
    if (n <= 1) return n;
    return _blockingUI(n - 1) + _blockingUI(n - 2);
  }

  String _makeSubtitle(int index, String title) {
    final upper = title.toUpperCase();
    return String.fromCharCodes(upper.runes.toList().reversed);
    // return index == 10
    //     ? _blockingUI(35).toString()
    //     : String.fromCharCodes(upper.runes.toList().reversed);
  }
}
