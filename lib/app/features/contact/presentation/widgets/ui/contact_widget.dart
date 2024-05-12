import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:site/app/core/injections/injections.dart';
import 'package:site/app/core/responsive/responsive.dart';
import 'package:site/app/core/shared/app_keys.dart';
import 'package:site/app/features/contact/contact.dart';
import 'package:site/app/widgets/snack_bars/snack_bars.dart';

class ContactWidget extends StatelessWidget {
  ContactWidget({
    super.key,
    ContactCubit? contactCubit,
  }) : _contactCubit = contactCubit ?? _cubit;

  final ContactCubit? _contactCubit;

  static final _cubit = ContactCubit(
    contactRepository: ContactRepositoryImpl(
      httpClient: getIt(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final messageController = TextEditingController();
    final subjectController = TextEditingController();

    final form = BlocProvider(
      create: (context) => _contactCubit ?? _cubit,
      child: BlocConsumer<ContactCubit, ContactState>(
        listener: (context, state) {
          if ([ContactSuccess, ContactError].contains(state.runtimeType)) {
            appShowSnackBarFromContact(context, state);
          }
        },
        builder: (context, state) {
          return CustomForm(
            formKey: formKey,
            nameController: nameController,
            emailController: emailController,
            subjectController: subjectController,
            messageController: messageController,
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                _contactCubit?.sendMail(
                  contact: ContactUser(
                    name: nameController.text,
                    email: emailController.text,
                    subject: subjectController.text,
                    message: messageController.text,
                  ),
                );

                for (var controller in [
                  nameController,
                  emailController,
                  messageController,
                  subjectController,
                ]) {
                  controller.clear();
                }
              }
            },
          );
        },
      ),
    );

    return LayoutBuilder(
      key: AppKeys.contact,
      builder: (context, constraints) {
        return constraints.maxWidth < Breakpoints.contact
            ? ContactMobile(form)
            : ContactWeb(form);
      },
    );
  }
}
