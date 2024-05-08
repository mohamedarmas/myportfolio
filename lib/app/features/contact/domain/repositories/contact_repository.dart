import 'package:site/app/core/result/result.dart';
import 'package:site/app/features/contact/contact.dart';

abstract class ContactRepository {
  Future<Result<ContactFailedResult, ContactAnswer>> sendMail({
    required ContactModel contact,
  });
}
