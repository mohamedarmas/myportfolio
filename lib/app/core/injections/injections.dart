import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:site/app/features/contact/contact.dart';
import 'package:get_it/get_it.dart';

import 'package:site/data/services/firebase/firebase.dart';

final getIt = GetIt.I;

void configureDependencies() {
  if (!getIt.isRegistered<Dio>()) {
    getIt.registerSingleton<Dio>(
      Dio(),
    );
  }
  if (!getIt.isRegistered<FirebaseRemoteConfig>()) {
    getIt.registerSingleton<FirebaseRemoteConfig>(
      FirebaseRemoteConfig.instance,
    );
  }
  if (!getIt.isRegistered<FirebaseService>()) {
    getIt.registerSingleton<FirebaseService>(
      FirebaseServiceImpl(),
    );
  }
  if (!getIt.isRegistered<ContactRepository>()) {
    getIt.registerSingleton<ContactRepository>(
      ContactRepositoryImpl(
        httpClient: getIt(),
      ),
    );
  }
}
