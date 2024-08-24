import 'package:flutter/material.dart';
import 'package:site/app/core/globals/globals.dart';
import 'package:site/app/core/l10n/l10n.dart';
import 'package:site/app/core/l10n/l10n.dart';

class AppTexts {
  static AppLocalizations get(BuildContext context) {
    if (context == null) {
      throw Exception('AppTexts.get: context is null');
    }

    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static AppLocalizations get getViaNavigatorKey {
    final navigatorKey = NavigationService.navigatorKeyContext;

    if (navigatorKey == null) {
      throw Exception(
        'AppTexts.getViaNavigatorKey: navigatorKeyContext is null',
      );
    }

    return Localizations.of<AppLocalizations>(navigatorKey!, AppLocalizations)!;
  }
}
