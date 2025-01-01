import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatever/utils/app_text_styles.dart';
import 'package:whatever/utils/content_spacing.dart';
import 'package:whatever/widgets/line_button.dart';
import 'package:whatever/widgets/custom_toggle_switch.dart';

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
                    height: ContentSpacing.spacing1,
                    color: Colors.blue.withOpacity(0.3),
                    width: double.infinity,
                    child: const Center(child: Text('Spacing 4')),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: ContentSpacing.spacing1),
                  ),
                  const SizedBox(height: ContentSpacing.spacing1),
                  Container(
                    height: ContentSpacing.spacing2,
                    color: Colors.blue.withOpacity(0.3),
                    width: double.infinity,
                    child: const Center(child: Text('Spacing 8')),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: ContentSpacing.spacing1),
                  ),
                  Container(
                    height: ContentSpacing.spacing3,
                    color: Colors.blue.withOpacity(0.3),
                    width: double.infinity,
                    child: const Center(child: Text('Spacing 16')),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('English Headline 1',
                      style: AppTextStyles.englishHeadline1),
                  Text('English Headline 2',
                      style: AppTextStyles.englishHeadline2),
                  Text('English Headline 3',
                      style: AppTextStyles.englishHeadline3),
                ],
              ),
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
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  LineButton(
                    onPressed: () {},
                    isDisabled: false,
                    width: 200,
                    text: 'Primary Button',
                  ),
                  LineButton(
                    onPressed: () {},
                    isDisabled: true,
                    width: 200,
                    text: 'Primary Button Disabled',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  LineButton.large(
                      onPressed: () {}, width: 200, text: "Large Button"),
                  const LineButton.largeDisabled(text: "Large Button Disabled"),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: const [
                  LineButton.medium(text: "medium"),
                  LineButton.mediumDisabled(text: "medium Disabled"),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: const [
                  LineButton.small(text: "small"),
                  LineButton.smallDisabled(text: "small Disabled"),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: const [
                  LineButton.xLarge(text: "xLarge Button"),
                  LineButton.xLargeDisabled(text: "xLarge Button Disabled"),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 32,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  StatefulBuilder(builder: (context, setState) {
                    return CustomToggleSwitch(
                      value: false,
                      onChanged: (value) {
                        setState(() {
                          value = !value;
                        });
                      },
                    );
                  }),
                ],
              ),
            ),
            // margin
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
