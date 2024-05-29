import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:site/app/core/l10n/l10n.dart';
import 'package:site/app/core/result/result.dart';
import 'package:site/app/features/contact/contact.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit({
    required ContactRepository contactRepository,
    AppLocalizations? appLocalizations,
  })  : _contactRepository = contactRepository,
        _appLocalizations = appLocalizations,
        super(
          const ContactInitial(),
        );

  final ContactRepository _contactRepository;
  final AppLocalizations? _appLocalizations;

  Future<void> sendMail({
    required ContactModel contact,
  }) async {
    emit(const ContactLoading());

    final result = await _contactRepository.sendMail(contact: contact);

    switch (result) {
      case Success(object: final contactAnswer):
        emit(
          ContactSuccess(
            contact: contactAnswer,
            message: (_appLocalizations ?? AppTexts.getViaNavigatorKey)
                .emailSendedWithSuccess,
          ),
        );
      case Failure(error: final contactFailedResult):
        emit(
          ContactError(
            contact: contact,
            message: contactFailedResult
                .message(_appLocalizations ?? AppTexts.getViaNavigatorKey),
          ),
        );
    }
  }
}
