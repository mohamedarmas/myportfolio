import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:site/app/features/contact/contact.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit({
    required ContactRepositoryImpl contactRepository,
  })  : _contactRepository = contactRepository,
        super(
          const ContactInitial(),
        );

  final ContactRepositoryImpl _contactRepository;

  Future<void> sendMail({
    required ContactModel contact,
  }) async {
    emit(const ContactLoading());

    try {
      await _contactRepository.sendMail(
        contact: contact,
      );
      emit(
        ContactSuccess(
          contact: contact,
          message: 'Email sent successfully',
        ),
      );
    } catch (e) {
      emit(
        ContactError(
          contact: contact,
          message: 'Error sending email',
        ),
      );
    }
  }
}


// class ContactController extends ChangeNotifier {
//   ContactController({
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
