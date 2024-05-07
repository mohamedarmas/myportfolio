import 'package:site/app/features/contact/domain/models/contact.dart';

abstract class ContactRepository {
  Future sendMail({required Contact contact});
}
