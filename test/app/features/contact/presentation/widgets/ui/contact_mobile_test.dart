import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:site/app/features/contact/presentation/widgets/ui/contact_mobile.dart';

import '../../../../../../flutter_test_config.dart';

void main() {
  testWidgets('Should renders ContactMobile', (tester) async {
    await appWidgetTest(
      tester: tester,
      widget: const ContactMobile(
        SizedBox(),
      ),
    );

    expect(
      find.byType(ContactMobile),
      findsOneWidget,
    );
  });
}
