import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:site/data/constants/constants_api.dart';
import 'package:site/data/services/recaptcha/recaptcha.dart';

class RecaptchaService {
  RecaptchaService._();

  static Future<void> initiate() async =>
      await GRecaptchaV3.ready(ConstantsAPI.recaptchaPublicKey);

  static Future<bool> isNotABot() async {
    if ([
      TargetPlatform.iOS,
      TargetPlatform.android,
    ].contains(defaultTargetPlatform)) {
      return true;
    }

    final verificationResponse = await _getVerificationResponse();

    if (verificationResponse == null) {
      return false;
    }

    final score = verificationResponse.score;
    return score >= 0.5 && score < 1;
  }

  static Future<RecaptchaResponse?> _getVerificationResponse() async {
    try {
      final token = await GRecaptchaV3.execute('submit') ?? '';

      if (token.isNotEmpty) {
        final response = await Dio().post(
          ConstantsAPI.recaptchaUrl,
          // body: {
          //   'secret': ConstantsAPI.recaptchaSecretKey,
          //   'response': token,
          // },
          // headers: {
          //   'Access-Control-Allow-Origin': '*',
          //   'Access-Control-Allow-Methods': 'POST',
          //   'Access-Control-Allow-Headers':
          //       'Origin, X-Requested-With, Content-Type, Accept',
          // },
          data: {
            'secret': ConstantsAPI.recaptchaSecretKey,
            'response': token,
          },
        );

        final body = response.data;

        return RecaptchaResponse.fromJson(body);
      } else {
        log('RecaptchaService._getVerificationResponse, token is empty');
      }
    } catch (e, s) {
      log(
        'RecaptchaService._getVerificationResponse, error: $e, stackTrace: $s',
      );
    }

    return null;
  }
}
