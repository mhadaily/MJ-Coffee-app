import 'package:flutter/material.dart';

import '../const.dart';

class MjButton extends StatelessWidget {
  const MjButton({Key key, this.onSubmitLoginButton}) : super(key: key);

  final onSubmitLoginButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: FlatButton(
              key: Key('signIn'),
              padding: EdgeInsets.fromLTRB(55, 15, 55, 15),
              onPressed: onSubmitLoginButton,
              child: Text(
                "Log In",
                style: TextStyle(color: Colors.white),
              ),
              color: darkBrown,
            )),
      ],
    );
  }
}
