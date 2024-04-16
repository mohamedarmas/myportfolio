import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:site/data/constants/constants_api.dart';

import 'package:site/data/models/models.dart';
import 'package:site/data/repositories/contact/contact.dart';

class ContactRepositoryImpl implements ContactRepository {
  ContactRepositoryImpl({
    required http.Client httpClient,
  }) : _httpClient = httpClient;

  final http.Client _httpClient;

  @override
  Future sendMail({
    required Contact contact,
  }) async {
    try {
      final response = await _httpClient.post(
        ConstantsAPI.apiSendMail,
        body: Contact.toJsonString(contact),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return response;
    } catch (e, s) {
      log('Error: $e', stackTrace: s);
    }
  }
}
