import 'package:flutter/material.dart';
import 'package:whatever/utils/app_text_styles.dart';
import 'package:whatever/utils/content_spacing.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ContentSpacing.spacing2),
      child: Center(
        child: Text(
          'Onboarding Screen 2: More info about authorization',
          style: AppTextStyles.englishBody1,
        ),
      ),
    );
  }
}
