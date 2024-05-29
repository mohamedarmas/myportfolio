import 'package:flutter_test/flutter_test.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:site/app/core/l10n/l10n.dart';
import 'package:site/app/core/result/result.dart';
import 'package:site/app/features/contact/contact.dart';

import '../../../../../utils/mocks/mock_app_texts.dart';
import '../../../../../utils/utils.dart';

void main() {
  late MockContactRepository mockContactRepository;
  late AppLocalizations appLocalizations;

  setUp(() {
    mockContactRepository = MockContactRepository();
    appLocalizations = MockAppLocalizations();

    setUpLocationMock(appLocalizations);
  });

  group('ContactCubit', () {
    final contact = AppFixtures().tContactUser;
    final contactAnswer = AppFixtures().tContactAnswer;

    blocTest<ContactCubit, ContactState>(
      'emits [ContactLoading, ContactSuccess] when sendMail is successful',
      build: () {
        when(
          () => mockContactRepository.sendMail(contact: contact),
        ).thenAnswer(
          (_) async => Success(contactAnswer),
        );

        return ContactCubit(
          contactRepository: mockContactRepository,
          appLocalizations: appLocalizations,
        );
      },
      act: (cubit) => cubit.sendMail(contact: contact),
      expect: () => [
        const ContactLoading(),
        ContactSuccess(
          contact: contactAnswer,
          message: MockAppLocalizationsHelper.emailSendedWithSuccess,
        ),
      ],
    );

    blocTest<ContactCubit, ContactState>(
      'emits [ContactLoading, ContactError] when sendMail fails',
      build: () {
        when(
          () => mockContactRepository.sendMail(contact: contact),
        ).thenAnswer(
          (_) async => const Failure(ContactFailedResult.unknown),
        );

        return ContactCubit(
          contactRepository: mockContactRepository,
          appLocalizations: appLocalizations,
        );
      },
      act: (cubit) => cubit.sendMail(contact: contact),
      expect: () => [
        const ContactLoading(),
        ContactError(contact: contact, message: 'Email unknown error'),
      ],
    );
  });
}

void setUpLocationMock(AppLocalizations appLocalizations) {
  when(() => appLocalizations.emailSendedWithSuccess)
      .thenReturn(MockAppLocalizationsHelper.emailSendedWithSuccess);
  when(() => appLocalizations.emailTooManyRequests)
      .thenReturn(MockAppLocalizationsHelper.emailTooManyRequests);
  when(() => appLocalizations.emailUnauthorized)
      .thenReturn(MockAppLocalizationsHelper.emailUnauthorized);
  when(() => appLocalizations.emailUnknowError)
      .thenReturn(MockAppLocalizationsHelper.emailUnknowError);
  when(() => appLocalizations.emailNotSended)
      .thenReturn(MockAppLocalizationsHelper.emailNotSended);
}
