import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:site/app/features/contact/contact.dart';

import '../../../../../../flutter_test_config.dart';
import '../../../../../../utils/utils.dart';

void main() {
  late ContactCubit contactCubit;

  setUp(() {
    contactCubit = MockContactCubit();

    when(() => contactCubit.stream).thenAnswer(
      (_) => Stream.value(const ContactInitial()),
    );

    when(() => contactCubit.state).thenReturn(const ContactInitial());
  });

  testWidgets('Should renders Contact', (tester) async {
    await appWidgetTest(
      tester: tester,
      widget: ContactWidget(
        contactCubit: contactCubit,
      ),
    );

    final contactWidget = find.byType(ContactWidget);
    expect(contactWidget, findsOneWidget);
  });

  group('ContactWidget LayoutBuilder Should renders', () {
    final contactMobile = find.byType(ContactMobile);
    final contactWeb = find.byType(ContactWeb);

    testWidgets(
      'ContactMobile when constraints is less than Breakpoints.contact',
      (tester) async {
        tester.view.physicalSize = const Size(200, 400);

        await appWidgetTest(
          tester: tester,
          widget: ContactWidget(
            contactCubit: contactCubit,
          ),
        );

        expect(contactMobile, findsOneWidget);
        expect(contactWeb, findsNothing);

        addTearDown(tester.view.resetPhysicalSize);
      },
    );

    testWidgets(
      'ContactWeb when constraints is greater than Breakpoints.contact',
      (tester) async {
        tester.view.physicalSize = const Size(2000, 400);

        await appWidgetTest(
          tester: tester,
          widget: ContactWidget(
            contactCubit: contactCubit,
          ),
        );

        expect(contactMobile, findsNothing);
        expect(contactWeb, findsOneWidget);

        addTearDown(tester.view.resetPhysicalSize);
      },
    );
  });
}
