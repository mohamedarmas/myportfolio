import 'package:site/app/core/l10n/l10n.dart';

enum ContactFailedResult {
  tooManyRequests,
  unauthorized,
  unknown,
  error;

  String get message {
    final texts = AppTexts.getViaNavigatorKey;

    return switch (this) {
      ContactFailedResult.tooManyRequests => texts.emailTooManyRequests,
      ContactFailedResult.unauthorized => texts.emailUnauthorized,
      ContactFailedResult.unknown => texts.emailUnknowError,
      ContactFailedResult.error => texts.emailNotSended,
    };
  }
}
