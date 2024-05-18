import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:site/app/core/tokens/tokens.dart';
import 'package:site/app/features/contact/presentation/presentation.dart';

ScaffoldFeatureController appShowSnackBar(
  BuildContext context, {
  required String text,
  required IconData icon,
  required Color color,
  required double width,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 8,
      width: width,
      duration: const Duration(seconds: 3),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Row(
        children: [
          Icon(
            icon,
            size: 28,
            color: AppColors.white,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: FittedBox(
              fit: BoxFit.contain,
              child: AutoSizeText(
                text,
                maxLines: 1,
                style: AppTextStyles.buttonTitle,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

ScaffoldFeatureController appShowSnackBarFromContact(
  BuildContext context,
  ContactState state,
) {
  return appShowSnackBar(
    context,
    width: 300,
    text: switch (state) {
      ContactSuccess() => state.message,
      ContactError() => state.message,
      _ => '',
    },
    icon: switch (state) {
      ContactSuccess() => Icons.check,
      ContactError() => Icons.error,
      _ => Icons.error,
    },
    color: switch (state) {
      ContactSuccess() => AppColors.primaryDark,
      ContactError() => AppColors.red,
      _ => AppColors.red,
    },
  );
}
