import 'dart:async';

import 'loading_fonts.dart';

Future<void> main(FutureOr<void> testMain()) async {
  print('Test -> flutter_test_config.dart');
  await loadAppFonts();

  await runZoned<dynamic>(
    testMain,
    zoneValues: <Type, String>{
      String: '/test_config',
    },
  );
}
