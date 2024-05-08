import 'package:site/app/features/contact/domain/models/contact_model.dart';

class ContactAnswer extends ContactModel {
  factory ContactAnswer.fromJson(Map<String, dynamic> json) {
    return ContactAnswer(
      name: json['sender_name'],
      email: json['source_email'],
      message: json['template_body'],
      subject: json['template_subject'],
      response: json['response'],
      status: json['status'],
    );
  }

  ContactAnswer({
    required super.name,
    required super.email,
    required super.message,
    required super.subject,
    required this.response,
    required this.status,
  });

  final String response;
  final String status;
}
