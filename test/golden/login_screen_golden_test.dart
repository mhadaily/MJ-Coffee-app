import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../lib/data_providers/auth_data_provider.dart';
import '../../lib/coffee_router.dart';
import '../../lib/screens/login.dart';
import '../../lib/data_providers/auth_provider.dart';

class MockAuthDataProvider extends Mock implements BaseAuth {}

void main() {
  final loginScaffoldKey = GlobalKey<ScaffoldState>();

  Widget makeTestableWidget({Widget child, BaseAuth auth}) {
    return AuthProvider(
      auth: auth,
      child: MaterialApp(
        home: child,
        navigatorKey: CoffeeRouter.instance.navigatorKey,
      ),
    );
  }

  testWidgets('LoginPage Golden', (WidgetTester tester) async {
    LoginScreen page = LoginScreen(
      scaffoldKey: loginScaffoldKey,
    );

    await tester.pumpWidget(
      makeTestableWidget(
        child: page,
      ),
    );

    await expectLater(
      find.byType(LoginScreen),
      matchesGoldenFile(
        'loginScreen.png',
        version: 2,
      ),
    );
  });
}
