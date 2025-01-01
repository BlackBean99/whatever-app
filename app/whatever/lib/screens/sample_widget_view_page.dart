import 'package:flutter/material.dart';
import 'package:whatever/screens/notification_page.dart';
import 'package:whatever/utils/bottom_sheet_options.dart';
import 'package:whatever/widgets/custom_bottom_sheet.dart';
import 'package:whatever/widgets/custom_toggle_switch.dart';
import 'package:whatever/widgets/custom_bottom_bar.dart';
import 'package:whatever/widgets/menu_page.dart';

class SampleWidgetViewPage extends StatefulWidget {
  const SampleWidgetViewPage({super.key});

  @override
  State<SampleWidgetViewPage> createState() => _SampleWidgetViewPageState();
}

class _SampleWidgetViewPageState extends State<SampleWidgetViewPage> {
  bool _toggleValue = false;
  int _currentIndex = 0;

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
                showMenuPage(context);
              },
            ),
            const SizedBox(width: 5),
            const Text('Widget Samples'),
            const Spacer(),
            IconButton(
              onPressed: () {
                showNotificationPage(context);
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
          buildBottomSheets(context),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget buildBottomSheets(BuildContext context) {
    return _buildSection(
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
    );
  }

  Future<Object?> showMenuPage(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: const Material(
            child: MenuPage(),
          ),
        );
      },
    );
  }

  Future<Object?> showNotificationPage(BuildContext context) {
    return showGeneralDialog(
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
          child: const NotificationPage(),
        );
      },
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
