import 'package:flutter/material.dart';
import 'package:whatever/utils/content_spacing.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: ContentSpacing.spacing2),
      child: Center(
        child: Text('Onboarding Screen 2: More info about authorization'),
      ),
    );
  }
}
