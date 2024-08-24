import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:site/app/features/contact/contact.dart';
import 'package:get_it/get_it.dart';

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
  if (!getIt.isRegistered<ContactRepository>()) {
    getIt.registerLazySingleton<ContactRepository>(
      () => ContactRepositoryImpl(
        httpClient: getIt(),
      ),
    );
  }
  if (!getIt.isRegistered<ContactCubit>()) {
    getIt.registerFactory<ContactCubit>(
      () => ContactCubit(
        contactRepository: getIt(),
      ),
    );
  }
}
