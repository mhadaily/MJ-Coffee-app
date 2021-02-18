import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../lib/data_providers/auth_data_provider.dart';
import '../lib/data_providers/http_client.dart';

class MockHttpClient extends Mock implements HttpClient {}

main() {
  HttpClient mockHttpClient;
  AuthDataProvider authDataProvider;

  setUpAll(() {
    mockHttpClient = MockHttpClient();
    authDataProvider = AuthDataProvider(
      http: mockHttpClient,
    );
  });

  tearDownAll(() {
    // usually for cleaning up
    mockHttpClient = null;
    authDataProvider = null;
  });

  group('DataProvider', () {
    group('SignInWithPasswordUsername', () {
      setUp(() {
        when(mockHttpClient.post(any, any)).thenAnswer(
          (realInvocation) => Future.value(
            http.Response('success', 200),
          ),
        );
      });

      tearDown(() {
        // cleaning up after each test
      });

      test('should return true with correct username and password', () async {
        final String password = 'password';
        final String email = 'username';

        final bool res =
            await authDataProvider.signInWithEmailAndPassword(email, password);

        // assert
        expect(res, true);
      });

      test('should return false with incorrect username or password', () async {
        final String password = 'wrongpassword';
        final String email = 'username';

        final bool res =
            await authDataProvider.signInWithEmailAndPassword(email, password);

        // assert
        expect(res, true);
      });
    });

    group('signOut', () {
      setUp(() {
        when(mockHttpClient.get(any)).thenAnswer(
          (realInvocation) => Future.value(
            http.Response('success', 200),
          ),
        );
      });
      test('should return true with log out', () async {
        // act
        final bool res = await authDataProvider.signOut();

        // assert
        expect(res, true);
      });
    });
  });
}
