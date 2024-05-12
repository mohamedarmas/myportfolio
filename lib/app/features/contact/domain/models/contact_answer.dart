import 'package:dio/dio.dart';
import 'package:site/app/features/contact/domain/models/contact_model.dart';

class ContactAnswer extends ContactModel {
  factory ContactAnswer.fromResponse({
    required ContactModel contact,
    required Response response,
  }) {
    return ContactAnswer(
      name: contact.name,
      email: contact.email,
      message: contact.message,
      subject: contact.subject,
      status: response.statusMessage ?? '',
      response: '${response.statusCode}',
    );
  }

  ContactAnswer({
    required super.name,
    required super.email,
    required super.message,
    required super.subject,
    required this.status,
    required this.response,
  });

  final String status;
  final String response;
}
