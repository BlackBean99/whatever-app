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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Handle menu button press
              },
            ),
            const SizedBox(width: 5),
            const Text('Widget Samples'),
            const Spacer(),
            IconButton(
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: '',
                  transitionDuration: const Duration(milliseconds: 300),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: Material(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: SafeArea(
                            child: Column(
                              children: [
                                AppBar(
                                  title: const Text('Notifications'),
                                  leading: IconButton(
                                    icon: const Icon(Icons.arrow_back),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title:
                                            Text('Notification ${index + 1}'),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.notifications),
            ),
          ],
        ),
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
