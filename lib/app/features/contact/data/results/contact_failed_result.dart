import 'package:site/app/core/globals/globals.dart';
import 'package:site/app/core/l10n/l10n.dart';

enum ContactFailedResult {
  tooManyRequests,
  unauthorized,
  unknown,
  error;

  String get message {
    final appTexts = AppTexts.get(NavigationService.navigatorKeyContext);

    return switch (this) {
      ContactFailedResult.tooManyRequests => appTexts.emailNotSended,
      ContactFailedResult.unauthorized => appTexts.emailNotSended,
      ContactFailedResult.unknown => appTexts.emailNotSended,
      ContactFailedResult.error => appTexts.emailNotSended,
    };
  }
}
