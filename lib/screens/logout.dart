import 'package:mjcoffee/coffee_router.dart';
import 'package:mjcoffee/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoutScreen extends StatefulWidget {
  static String routeName = 'LogoutScreen';
  static Route<LogoutScreen> route() {
    return MaterialPageRoute<LogoutScreen>(
      settings: RouteSettings(name: routeName),
      builder: (BuildContext context) => LogoutScreen(),
    );
  }

  @override
  _LogoutScreenState createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Center(
          child: Column(
            children: <Widget>[
              SvgPicture.asset(
                "assets/coffee_break.svg",
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                semanticsLabel: 'MJ Coffee',
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: OutlineButton(
            onPressed: () {
              CoffeeRouter.instance.push(HomeScreen.route());
            },
            child: Text('Logout'),
          ),
        ),
      ],
    );
  }
}
