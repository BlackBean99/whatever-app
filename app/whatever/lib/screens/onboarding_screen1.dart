import 'package:flutter/material.dart';
import 'package:whatever/utils/app_text_styles.dart';
import 'package:whatever/utils/content_spacing.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ContentSpacing.spacing2),
      child: Center(
        child: Text(
          'Onboarding Screen 1: Please Authorize',
          style: AppTextStyles.englishBody1,
        ),
      ),
    );
  }
}
