import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:site/app/features/contact/contact.dart';

import '../../../../../../flutter_test_config.dart';

void main() {
  testWidgets('Should renders ContactWeb', (tester) async {
    await appWidgetTest(
      tester: tester,
      widget: const ContactWeb(
        SizedBox(),
      ),
    );

    expect(
      find.byType(ContactWeb),
      findsOneWidget,
    );
  });
}
