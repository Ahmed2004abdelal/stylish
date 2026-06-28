import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../theme/style.dart';

class CreateAccountText extends StatelessWidget {
  final String text;
  final String actionText;
  final void Function()? onTap;
  const CreateAccountText({super.key, required this.text, required this.actionText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: text,
          style: AppTextStyles.font14RegularBlackGrey,
          children: [
            TextSpan(
              text: actionText,
              style: AppTextStyles.font14SemiBoldRed,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  onTap?.call();
                },
            ),
          ],
        ),
      ),
    );
  }
}