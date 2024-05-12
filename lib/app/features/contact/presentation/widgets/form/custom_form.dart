import 'package:flutter/material.dart';

import 'package:site/app/core/injections/injections.dart';
import 'package:site/app/core/l10n/l10n.dart';
import 'package:site/app/features/contact/contact.dart';
import 'package:site/app/utils/contact_validators.dart';
import 'package:site/app/widgets/buttons/buttons.dart';
import 'package:site/app/widgets/dividers/dividers.dart';

class CustomForm extends StatelessWidget {
  CustomForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.subjectController,
    required this.messageController,
    required this.onPressed,
    ContactCubit? contactCubit,
  }) : _contactCubit = contactCubit ??
            ContactCubit(
              contactRepository: ContactRepositoryImpl(
                httpClient: getIt(),
              ),
            );

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController subjectController;
  final TextEditingController messageController;
  final VoidCallback onPressed;
  final ContactCubit? _contactCubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextFormField(
              controller: nameController,
              hintText: AppTexts.get(context).name,
              prefixIcon: Icons.account_circle,
              validator: (value) => ContactValidators.name(value, context),
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              controller: emailController,
              hintText: AppTexts.get(context).email,
              validator: (value) => ContactValidators.email(value, context),
              prefixIcon: Icons.mail,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              controller: subjectController,
              hintText: AppTexts.get(context).title,
              prefixIcon: Icons.subject,
              validator: (value) => ContactValidators.subject(value, context),
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              controller: messageController,
              hintText: AppTexts.get(context).text,
              prefixIcon: Icons.comment,
              validator: (value) => ContactValidators.message(value, context),
              maxLines: 2,
            ),
            const Center(
              child: ContactDivider(),
            ),
            Center(
              child: AppTextButton(
                text: AppTexts.get(context).sendEmailUpper,

                /// TODO:
                // onPressed: onPressed,
                onPressed: () {
                  _contactCubit?.sendMail(
                    contact: ContactUser(
                      name: 'felipe sales',
                      email: 'soufeliposales@gmail.com',
                      message: 'teste de mensagem',
                      subject: 'vamos testar, mais uma vez',
                    ),
                  );
                },
                onLongPress: () {
                  _contactCubit?.sendMail(
                    contact: ContactUser(
                      name: 'felipe sales',
                      email: 'soufeliposales@gmail.com',
                      message: 'teste de mensagem',
                      subject: 'vamos testar, mais uma vez',
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
