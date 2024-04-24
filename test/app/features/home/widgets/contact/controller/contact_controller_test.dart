import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:site/app/features/home/widgets/contact/controller/contact_controller.dart';
import 'package:site/data/repositories/contact/contact.dart';

import '../../../../../../utils/utils.dart';

void main() {
  setupFirebaseAuthMocks();
  late MockHttpClient mockHttpClient;
  late ContactRepositoryImpl contactRepository;
  late ContactController contactController;

  setUp(() {
    mockHttpClient = MockHttpClient();
    contactRepository = ContactRepositoryImpl(
      httpClient: mockHttpClient,
    );
    contactController = ContactController(
      contactRepository: contactRepository,
    );

    when(
      () => mockHttpClient.post(
        any(),
        data: any(named: 'data'),
        options: any(named: 'options'),
      ),
    ).thenAnswer(
      (_) async => Response(
        data: {},
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );
  });

  setUpAll(() async {
    if (Firebase.apps.isEmpty) await Firebase.initializeApp();
    registerFallbackValue(UriFake());
  });

  test('ContactController', () {
    expect(
      contactController,
      isInstanceOf<ChangeNotifier>(),
    );

    expect(
      contactController,
      isInstanceOf<ContactController>(),
    );

    expect(
      contactController.sendMail,
      isInstanceOf<Function>(),
    );

    var sendMail = contactController.sendMail(
      contact: AppFixtures().tContact,
    );

    expect(
      () => sendMail,
      isInstanceOf<void>(),
    );
  });
}
