import 'package:site/app/features/contact/contact.dart';

import '../mocks/mock_app_texts.dart';

class AppFixtures {
  final tContactUser = ContactUser(
    name: 'felipecastrosales',
    email: 'fakeemail@gmail.com',
    message: 'Hello, World!',
    subject: 'Hello, World!',
  );

  final tContactAnswer = ContactAnswer(
    name: 'felipecastrosales',
    email: 'fakeemail@gmail.com',
    message: 'Hello, World!',
    subject: 'Hello, World!',
    statusCode: 200,
    responseMessage: MockAppLocalizationsHelper.emailSendedWithSuccess,
  );
}
