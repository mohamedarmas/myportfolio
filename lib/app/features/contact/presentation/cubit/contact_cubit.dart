import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:site/app/core/result/result.dart';
import 'package:site/app/features/contact/contact.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit({
    required ContactRepository contactRepository,
  })  : _contactRepository = contactRepository,
        super(
          const ContactInitial(),
        );

  final ContactRepository _contactRepository;

  Future<void> sendMail({
    required ContactModel contact,
  }) async {
    emit(const ContactLoading());

    try {
      final result = await _contactRepository.sendMail(contact: contact);

      switch (result) {
        case Success(object: final contactAnswer):
          emit(
            ContactSuccess(
              contact: contactAnswer,
              message: 'Email sent successfully',
            ),
          );
        case Failure(error: final contactFailedResult):
          emit(
            ContactError(
              contact: contact,
              message: switch (contactFailedResult) {
                ContactFailedResult.unauthorized => 'Unauthorized',
                ContactFailedResult.tooManyRequests =>
                  'Too many requests, try again later',
                ContactFailedResult.unknown => 'Error sending email',
              },
            ),
          );
      }
    } catch (e, s) {
      log('[Error]: ContactCubit.sendMail', error: e, stackTrace: s);
      emit(
        ContactError(
          contact: contact,
          message: 'Error sending email',
        ),
      );
    }
  }
}


// class ContactCubit extends ChangeNotifier {
//   ContactCubit({
//     ContactRepositoryImpl? contactRepository,
//   }) : _contactRepository = contactRepository ?? getIt();

//   final ContactRepositoryImpl _contactRepository;

//   Future<void> sendMail({
//     required Contact contact,
//   }) {
//     return _contactRepository.sendMail(
//       contact: contact,
//     );
//   }
// }
