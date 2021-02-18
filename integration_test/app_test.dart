import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../lib/main_test.dart' as app;
import '../lib/screens/login.dart';
import '../lib/screens/splash_screen.dart';
import '../lib/screens/menu.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "Loading -> tab login button -> see login screen",
    (WidgetTester tester) async {
      app.main();
      await tester.pump();

      expect(find.byType(SplashScreen), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 3));

      final homeLoginButton = find.byKey(Key('homeLoginButton'));

      expect(homeLoginButton, findsOneWidget);

      await tester.tap(homeLoginButton);

      await tester.pumpAndSettle();

      expect(find.byType(LoginScreen), findsOneWidget);
    },
  );

  testWidgets(
    "Loading -> tab login button -> enter correct username password -> see MenuScreen",
    (WidgetTester tester) async {
      app.main();
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 3));
      final homeLoginButton = find.byKey(Key('homeLoginButton'));
      await tester.tap(homeLoginButton);
      await tester.pumpAndSettle();

      Finder emailField = find.byKey(Key('email'));
      expect(emailField, findsOneWidget);
      await tester.enterText(emailField, 'email');

      Finder passwordField = find.byKey(Key('password'));
      expect(passwordField, findsOneWidget);
      await tester.enterText(passwordField, 'password');

      await tester.tap(find.byKey(Key('signIn')));

      await tester.pumpAndSettle(Duration(seconds: 5));

      expect(find.byType(SnackBar), findsNothing);
      expect(find.byType(MenuScreen), findsOneWidget);
    },
  );
}


