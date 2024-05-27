import 'package:flutter_test/flutter_test.dart';

import 'package:site/app/app_widget.dart';

import '../flutter_test_config.dart';
import '../utils/utils.dart';

void main() {
  late MockFirebaseRemoteConfig mockFirebaseRemoteConfig;
  late MockContactCubit mockContactCubit;

  setUp(() {
    mockFirebaseRemoteConfig = MockFirebaseRemoteConfig();
    mockContactCubit = MockContactCubit();
  });

  testWidgets('Should renders AppWidget', (tester) async {
    await appWidgetTest(
      tester: tester,
      widget: AppWidget(
        firebaseRemoteConfig: mockFirebaseRemoteConfig,
        contactCubit: mockContactCubit,
      ),
    );

    expect(
      find.byType(AppWidget),
      findsOneWidget,
    );
  });
}
