import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatever/utils/app_text_styles.dart';
import 'package:whatever/utils/content_spacing.dart';
import 'package:whatever/widgets/line_button.dart';

class SampleWidgetViewTestPage extends StatelessWidget {
  const SampleWidgetViewTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Test Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Content Spacing Examples',
                  style: AppTextStyles.englishBody1),
            ),
            // Content Spacing Examples
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: ContentSpacing.spacing4,
                    color: Colors.blue.withOpacity(0.3),
                    width: double.infinity,
                    child: const Center(child: Text('Spacing 4')),
                  ),
                  const SizedBox(height: ContentSpacing.spacing1),
                  Container(
                    height: ContentSpacing.spacing4,
                    color: Colors.blue.withOpacity(0.3),
                    width: double.infinity,
                    child: const Center(child: Text('Spacing 8')),
                  ),
                  const SizedBox(height: ContentSpacing.spacing6),
                  Container(
                    height: ContentSpacing.spacing4,
                    color: Colors.blue.withOpacity(0.3),
                    width: double.infinity,
                    child: const Center(child: Text('Spacing 16')),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Text Caption Style',
                  style: AppTextStyles.englishCaption1),
            ),
            // Text Style Examples
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('english body1', style: AppTextStyles.englishBody1),
                  const SizedBox(height: 8),
                  Text('english body2', style: AppTextStyles.englishBody2),
                  const SizedBox(height: 8),
                  Text('english body3', style: AppTextStyles.englishBody3),
                  const SizedBox(height: 8),
                  Text('english button1', style: AppTextStyles.englishButton1),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child:
                  Text('Custom Buttons', style: AppTextStyles.englishHeadline1),
            ),
            // Custom Button Examples
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  LineButton(
                    onPressed: () {},
                    width: 100,
                    text: 'Primary Button',
                  ),
                  const SizedBox(width: 16),
                  const LineButton.large(text: "Large Button"),
                  const LineButton.medium(text: "medium"),
                  const LineButton.small(text: "small"),
                  const LineButton.largeDisabled(text: "Large Disabled"),
                  const LineButton.mediumDisabled(text: "medium Disabled"),
                  const LineButton.smallDisabled(text: "small Disabled"),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
