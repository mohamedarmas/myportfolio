import 'dart:developer';
import 'dart:io';

import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:http/http.dart' as http;
import 'package:site/data/constants/constants_api.dart';
import 'package:site/data/services/recaptcha/recaptcha.dart';

class RecaptchaService {
  RecaptchaService._();

  static Future<void> initiate() async =>
      await GRecaptchaV3.ready(ConstantsAPI.recaptchaPublicKey);

  static Future<bool> isNotABot() async {
    final verificationResponse = await _getVerificationResponse();

    if (Platform.isAndroid || Platform.isIOS) {
      return true;
    }

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
        final response = await http.post(
          ConstantsAPI.recaptchaUrl,
          body: {
            'secret': ConstantsAPI.recaptchaSecretKey,
            'response': token,
          },
          headers: {
            'Access-Control-Allow-Origin': '*',
          },
        );
        final body = response.body;

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
