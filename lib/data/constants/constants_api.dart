import 'package:site/infra/env/env.dart';

class ConstantsAPI {
  /// Send email endpoint.
  static final apiSendMail = Env.apiSendMail;

  /// Recaptcha information.
  static final recaptchaPublicKey = Env.recaptchaPublicKey;
  static final recaptchaSecretKey = Env.recaptchaSecretKey;
  static const recaptchaUrl = 'https://www.google.com/recaptcha/api/siteverify';
}
