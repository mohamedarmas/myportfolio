import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:url_strategy/url_strategy.dart';

import 'package:site/app/app_widget.dart';
import 'package:site/app/core/injections/injections.dart';
import 'package:site/data/services/firebase/firebase.dart';
import 'package:site/data/services/recaptcha/recaptcha.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await FirebaseServiceImpl().setUpInitialization();

    if (kIsWeb) {
      await RecaptchaService.initiate();
    }

    setPathUrlStrategy();
    configureDependencies();
    runApp(
      AppWidget(),
    );
  }, (error, stackTrace) {
    log('runZonedGuarded: Caught error: $error');
    log('runZonedGuarded: StackTrace: $stackTrace');
  });
}
