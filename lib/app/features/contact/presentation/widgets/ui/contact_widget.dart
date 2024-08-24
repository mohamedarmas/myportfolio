import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:site/app/core/responsive/responsive.dart';
import 'package:site/app/core/shared/app_keys.dart';
import 'package:site/app/features/contact/contact.dart';
import 'package:site/app/widgets/snack_bars/snack_bars.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
    required this.contactCubit,
  });

  final ContactCubit contactCubit;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final messageController = TextEditingController();
    final subjectController = TextEditingController();

    final form = BlocListener<ContactCubit, ContactState>(
      listener: (context, state) {
        if ([ContactSuccess, ContactError].contains(state.runtimeType)) {
          appShowSnackBarFromContact(context, state);
        }

        if (state is ContactSuccess) {
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
      child: CustomForm(
        formKey: formKey,
        nameController: nameController,
        emailController: emailController,
        subjectController: subjectController,
        messageController: messageController,
        onPressed: () {
          if (formKey.currentState?.validate() ?? false) {
            contactCubit.sendMail(
              contact: ContactUser(
                name: nameController.text,
                email: emailController.text,
                subject: subjectController.text,
                message: messageController.text,
              ),
            );
          }
        },
      ),
    );

    return BlocProvider.value(
      value: contactCubit,
      child: LayoutBuilder(
        key: AppKeys.contact,
        builder: (context, constraints) {
          return constraints.maxWidth < Breakpoints.contact
              ? ContactMobile(form)
              : ContactWeb(form);
        },
      ),
    );
  }
}
