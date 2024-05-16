import 'package:flutter/material.dart';

import 'package:site/app/core/l10n/l10n.dart';

class AppTexts {
  static AppLocalizations get(BuildContext? context) {
    if (context == null) {
      throw Exception('AppTexts.get: context is null');
    }

    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
}
