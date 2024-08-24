import 'package:envied/envied.dart';

part 'env.g.dart';

// Rename and / or create .env file in the root of the project
// (already has a .env.example file to help)
// - Add the following variables.
// And run the following commands:
// dart run build_runner clean
// dart run build_runner build --delete-conflicting-outputs

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'RECAPTCHA_PUBLIC_KEY', obfuscate: true)
  static final String recaptchaPublicKey = _Env.recaptchaPublicKey;

  @EnviedField(varName: 'RECAPTCHA_SECRET_KEY', obfuscate: true)
  static final String recaptchaSecretKey = _Env.recaptchaSecretKey;

  @EnviedField(varName: 'API_SEND_MAIL', obfuscate: true)
  static final String apiSendMail = _Env.apiSendMail;
}
