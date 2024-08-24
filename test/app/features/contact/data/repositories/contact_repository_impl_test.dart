import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:site/app/features/contact/contact.dart';

import '../../../../../utils/utils.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late ContactRepositoryImpl contactRepository;

  setUp(() {
    mockHttpClient = MockHttpClient();
    contactRepository = ContactRepositoryImpl(
      httpClient: mockHttpClient,
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

  setUpAll(() {
    registerFallbackValue(UriFake());
  });

  test('ContactRepositoryImpl', () async {
    expect(
      contactRepository,
      isNotNull,
    );

    await contactRepository.sendMail(
      contact: AppFixtures().tContactUser,
    );

    verify(
      () => mockHttpClient.post(
        any(),
        data: any(named: 'data'),
        options: any(named: 'options'),
      ),
    ).called(1);
  });
}
