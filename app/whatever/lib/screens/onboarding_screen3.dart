import 'package:flutter/material.dart';
import 'package:whatever/utils/content_spacing.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: ContentSpacing.spacing2),
      child: Center(
        child: Text('Onboarding Screen 3: Final step for authorization'),
      ),
    );
  }
}
