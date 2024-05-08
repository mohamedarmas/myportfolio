import 'dart:convert';

import 'package:site/app/features/contact/contact.dart';

class ContactUser extends ContactModel {
  ContactUser({
    required super.name,
    required super.email,
    required super.message,
    required super.subject,
  });

  static Map<String, dynamic> toJson(ContactModel contact) {
    return {
      'sender_name': contact.name,
      'source_email': contact.email,
      'template_subject': contact.subject,
      'template_body': contact.message,
    };
  }

  static String toJsonString(ContactModel contact) =>
      jsonEncode(toJson(contact));
}
