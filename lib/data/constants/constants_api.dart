import 'package:site/infra/env/env.dart';

class ConstantsAPI {
  static const baseUrl = 'https://api.emailjs.com/api/v1.0/email/send';
  static const headers = {
    'origin': 'http://localhost',
    'Content-Type': 'application/json',
  };

  /// Send email endpoint.
  static final apiSendMail = Env.apiSendMail;

  /// Recaptcha information.
  static final recaptchaPublicKey = Env.recaptchaPublicKey;
  static final recaptchaSecretKey = Env.recaptchaSecretKey;
  static final recaptchaUrl =
      Uri.parse('https://www.google.com/recaptcha/api/siteverify');
}
