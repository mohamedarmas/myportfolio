import 'package:mocktail/mocktail.dart';
import 'package:site/app/core/l10n/l10n.dart';

class MockAppLocalizations extends Mock implements AppLocalizations {}

class MockAppLocalizationsHelper {
  static const emailSendedWithSuccess = 'Email sended with success';
  static const emailTooManyRequests = 'Email too many requests';
  static const emailUnauthorized = 'Email unauthorized';
  static const emailUnknowError = 'Email unknown error';
  static const emailNotSended = 'Email not sended';
}
