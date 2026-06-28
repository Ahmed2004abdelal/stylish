import 'package:flutter/material.dart';

import '../../../../../../core/theme/style.dart';

class OrContinueWith extends StatelessWidget {
  const OrContinueWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '-\tOr continue with\t-',
        style: AppTextStyles.font12MediumBlackGrey,
      ),
    );
  }
}
