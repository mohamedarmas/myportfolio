import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:site/app/core/result/result.dart';

import 'package:site/app/features/contact/contact.dart';
import 'package:site/data/constants/constants_api.dart';

class ContactRepositoryImpl implements ContactRepository {
  ContactRepositoryImpl({
    required Dio httpClient,
  }) : _httpClient = httpClient;

  final Dio _httpClient;

  @override
  Future<Result<ContactFailedResult, ContactAnswer>> sendMail({
    required ContactModel contact,
  }) async {
    try {
      final Response response = await _httpClient.post(
        ConstantsAPI.apiSendMail,
        data: ContactUser.toJson(contact),
      );

      return Success(
        ContactAnswer.fromResponse(
          contact: contact,
          response: response,
        ),
      );
    } catch (e, s) {
      log('[Error]: ContactRepositoryImpl.sendMail', error: e, stackTrace: s);

      return const Failure(
        ContactFailedResult.unknown,
      );
    }
  }
}
