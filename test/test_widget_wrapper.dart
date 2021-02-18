import 'package:flutter/material.dart';

import '../lib/coffee_router.dart';
import '../lib/data_providers/auth_data_provider.dart';
import '../lib/data_providers/auth_provider.dart';

Widget makeTestableWidget({Widget child, BaseAuth auth}) {
  return AuthProvider(
    auth: auth,
    child: MaterialApp(
      home: child,
      navigatorKey: CoffeeRouter.instance.navigatorKey,
    ),
  );
}
