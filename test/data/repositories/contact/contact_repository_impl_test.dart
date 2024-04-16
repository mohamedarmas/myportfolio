import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import 'package:site/data/repositories/contact/contact.dart';

import '../../../utils/utils.dart';

void main() {
  late MockFirebaseRemoteConfig mockFirebaseRemoteConfig;
  late MockHttpClient mockHttpClient;
  late ContactRepositoryImpl contactRepository;

  setUp(() {
    mockFirebaseRemoteConfig = MockFirebaseRemoteConfig();
    mockHttpClient = MockHttpClient();

    contactRepository = ContactRepositoryImpl(
      httpClient: mockHttpClient,
    );

    when(
      () => mockHttpClient.post(
        any(),
        headers: any(named: 'headers'),
        body: any(named: 'body'),
      ),
    ).thenAnswer(
      (_) async => http.Response(
        '',
        200,
      ),
    );
  });

  setUpAll(() {
    registerFallbackValue(UriFake());
  });

  test('ContactRepositoryImpl', () async {
    expect(
      contactRepository,
      isNotNull,
    );

    await contactRepository.sendMail(
      contact: AppFixtures().tContact,
    );
  });
}
