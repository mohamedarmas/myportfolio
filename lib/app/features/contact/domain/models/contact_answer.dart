import 'package:dio/dio.dart';
import 'package:site/app/core/shared/shared.dart';
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
      statusCode: response.statusCode ?? AppValues.invalidValue,
      responseMessage: '${(response.data as Map<String, dynamic>)['message']}',
    );
  }

  ContactAnswer({
    required super.name,
    required super.email,
    required super.message,
    required super.subject,
    required this.statusCode,
    required this.responseMessage,
  });

  final int statusCode;
  final String responseMessage;
}
