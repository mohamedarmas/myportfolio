import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import 'package:site/app/core/globals/globals.dart';
import 'package:site/app/core/injections/injections.dart';
import 'package:site/app/core/l10n/l10n.dart';
import 'package:site/app/core/themes/app_theme.dart';
import 'package:site/app/features/home/home_page.dart';

class AppWidget extends StatelessWidget {
  AppWidget({
    super.key,
    FirebaseRemoteConfig? firebaseRemoteConfig,
    Dio? httpClient,
  })  : _firebaseRemoteConfig = firebaseRemoteConfig ?? getIt(),
        _httpClient = httpClient ?? getIt();

  final FirebaseRemoteConfig _firebaseRemoteConfig;
  final Dio _httpClient;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      onGenerateTitle: (context) => AppTexts.get(context).projectTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: HomePage(
        firebaseRemoteConfig: _firebaseRemoteConfig,
        httpClient: _httpClient,
      ),
    );
  }
}
