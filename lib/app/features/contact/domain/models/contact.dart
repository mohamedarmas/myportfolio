import 'dart:convert';

class Contact {
  Contact({
    required this.name,
    required this.email,
    required this.message,
    required this.subject,
  });

  final String name, email, message, subject;

  static Map<String, dynamic> toJson(Contact contact) {
    return {
      'sender_name': contact.name,
      'source_email': contact.email,
      'template_subject': contact.subject,
      'template_body': contact.message,
    };
  }

  static String toJsonString(Contact contact) => jsonEncode(toJson(contact));
}
