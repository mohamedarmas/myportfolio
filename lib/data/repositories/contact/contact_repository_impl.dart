import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:site/data/constants/constants_api.dart';

import 'package:site/data/models/models.dart';
import 'package:site/data/repositories/contact/contact.dart';

class ContactRepositoryImpl implements ContactRepository {
  ContactRepositoryImpl({
    required Dio httpClient,
  }) : _httpClient = httpClient;

  final Dio _httpClient;

  @override
  Future sendMail({
    required Contact contact,
  }) async {
    try {
      final response = await _httpClient.post(
        ConstantsAPI.apiSendMail,
        data: Contact.toJson(contact),
      );

      return response.data;
    } catch (e, s) {
      log('Error: $e', stackTrace: s);
    }
  }
}
