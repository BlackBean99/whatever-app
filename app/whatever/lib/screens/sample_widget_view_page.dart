import 'package:flutter/material.dart';
import 'package:whatever/utils/bottom_sheet_options.dart';
import 'package:whatever/widgets/custom_bottom_sheet.dart';
import 'package:whatever/widgets/custom_toggle_switch.dart';

class SampleWidgetViewPage extends StatefulWidget {
  const SampleWidgetViewPage({super.key});

  @override
  State<SampleWidgetViewPage> createState() => _SampleWidgetViewPageState();
}

class _SampleWidgetViewPageState extends State<SampleWidgetViewPage> {
  bool _toggleValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Samples'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            'Toggle Switch',
            CustomToggleSwitch(
              value: _toggleValue,
              onChanged: (value) {
                setState(() {
                  _toggleValue = value;
                });
              },
            ),
          ),
          const SizedBox(height: 24),
          _buildSection(
            'Bottom Sheets',
            Column(
              children: BottomSheetType.values.map((type) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      CustomBottomSheet(
                        type: type,
                        context: context,
                      ).show();
                    },
                    child: Text('Show ${type.displayName}'),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        content,
      ],
    );
  }
}
