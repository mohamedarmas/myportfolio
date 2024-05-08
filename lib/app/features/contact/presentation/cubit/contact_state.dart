part of 'contact_cubit.dart';

@immutable
sealed class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

final class ContactInitial extends ContactState {
  const ContactInitial();

  @override
  List<Object> get props => [];
}

final class ContactLoading extends ContactState {
  const ContactLoading();

  @override
  List<Object> get props => [];
}

final class ContactSuccess extends ContactState {
  const ContactSuccess({
    required this.contact,
    required this.message,
  });

  final Contact contact;
  final String message;

  @override
  List<Object> get props => [contact, message];
}

final class ContactError extends ContactState {
  const ContactError({
    required this.contact,
    required this.message,
  });

  final Contact contact;
  final String message;

  @override
  List<Object> get props => [contact, message];
}
