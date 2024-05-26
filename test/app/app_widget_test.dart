import 'package:flutter_test/flutter_test.dart';

import 'package:site/app/app_widget.dart';

import '../flutter_test_config.dart';
import '../utils/utils.dart';

void main() {
  late MockFirebaseRemoteConfig mockFirebaseRemoteConfig;

  setUp(() {
    mockFirebaseRemoteConfig = MockFirebaseRemoteConfig();
  });

  testWidgets('Should renders AppWidget', (tester) async {
    await appWidgetTest(
      tester: tester,
      widget: AppWidget(
        firebaseRemoteConfig: mockFirebaseRemoteConfig,
      ),
    );

    expect(
      find.byType(AppWidget),
      findsOneWidget,
    );
  });
}
