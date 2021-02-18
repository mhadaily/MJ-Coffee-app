import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../lib/data_providers/auth_data_provider.dart';
import '../lib/screens/login.dart';
import '../lib/screens/menu.dart';
import 'test_widget_wrapper.dart';

class MockAuthDataProvider extends Mock implements BaseAuth {}

void main() {
  final loginScaffoldKey = GlobalKey<ScaffoldState>();

  group('LoginPage', () {
    test('should throw AssertionError when scaffoldKey is null', () {
      expect(
        () => LoginScreen(
          scaffoldKey: null,
        ),
        throwsAssertionError,
      );
    });

    testWidgets('should render', (WidgetTester tester) async {
      LoginScreen page = LoginScreen(
        scaffoldKey: loginScaffoldKey,
      );

      await tester.pumpWidget(
        makeTestableWidget(
          child: page,
        ),
      );

      expect(find.byType(LoginScreen), findsOneWidget);
    });

    testWidgets('should have two TextFormFields', (WidgetTester tester) async {
      LoginScreen page = LoginScreen(
        scaffoldKey: loginScaffoldKey,
      );

      await tester.pumpWidget(
        makeTestableWidget(
          child: page,
        ),
      );

      expect(find.byType(TextFormField), findsNWidgets(2));
    });

    testWidgets('should render logo', (WidgetTester tester) async {
      LoginScreen page = LoginScreen(
        scaffoldKey: loginScaffoldKey,
      );

      await tester.pumpWidget(
        makeTestableWidget(
          child: page,
        ),
      );

      expect(find.bySemanticsLabel('logo'), findsOneWidget);
    });

    testWidgets(
      'should show error if email is empty',
      (WidgetTester tester) async {
        MockAuthDataProvider mockAuth = MockAuthDataProvider();

        LoginScreen page = LoginScreen(
          scaffoldKey: loginScaffoldKey,
        );

        await tester.pumpWidget(
          makeTestableWidget(child: page, auth: mockAuth),
        );

        await tester.tap(find.byKey(Key('signIn')));

        verifyNever(mockAuth.signInWithEmailAndPassword('', 'password'));

        await tester.pump();

        expect(
          find.widgetWithText(TextFormField, 'Email can\'t be empty'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should show error if passworrd is empty',
      (WidgetTester tester) async {
        MockAuthDataProvider mockAuth = MockAuthDataProvider();

        LoginScreen page = LoginScreen(
          scaffoldKey: loginScaffoldKey,
        );

        await tester.pumpWidget(
          makeTestableWidget(child: page, auth: mockAuth),
        );

        await tester.tap(find.byKey(Key('signIn')));

        verifyNever(mockAuth.signInWithEmailAndPassword('email', ''));

        await tester.pump();

        expect(
          find.widgetWithText(TextFormField, 'Password can\'t be empty'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should show error if email or password is incorrect',
      (WidgetTester tester) async {
        MockAuthDataProvider mockAuth = MockAuthDataProvider();

        LoginScreen page = LoginScreen(
          scaffoldKey: loginScaffoldKey,
        );

        await tester.pumpWidget(
          makeTestableWidget(child: page, auth: mockAuth),
        );

        Finder emailField = find.byKey(Key('email'));
        await tester.enterText(emailField, 'incorrectemail');

        Finder passwordField = find.byKey(Key('password'));
        await tester.enterText(passwordField, 'incorrectpassword');

        when(
          mockAuth.signInWithEmailAndPassword(any, any),
        ).thenAnswer(
          (realInvocation) => Future.value(false),
        );

        await tester.tap(find.byKey(Key('signIn')));

        await tester.pump();

        expect(find.byType(SnackBar), findsOneWidget);
      },
    );

    testWidgets(
      'should redirect to dashboard if email or password is correct',
      (WidgetTester tester) async {
        MockAuthDataProvider mockAuth = MockAuthDataProvider();

        when(mockAuth.signInWithEmailAndPassword('email', 'password'))
            .thenAnswer((invocation) => Future.value(true));

        LoginScreen page = LoginScreen(
          scaffoldKey: loginScaffoldKey,
        );

        await tester
            .pumpWidget(makeTestableWidget(child: page, auth: mockAuth));

        Finder emailField = find.byKey(Key('email'));
        await tester.enterText(emailField, 'email');

        Finder passwordField = find.byKey(Key('password'));
        await tester.enterText(passwordField, 'password');

        when(
          mockAuth.signInWithEmailAndPassword(
            any,
            any,
          ),
        ).thenAnswer(
          (realInvocation) => Future.value(true),
        );

        await tester.tap(find.byKey(Key('signIn')));

        // Rebuild the widget after the state has changed.
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsNothing);
        expect(find.byType(MenuScreen), findsOneWidget);
      },
    );
  });
}
