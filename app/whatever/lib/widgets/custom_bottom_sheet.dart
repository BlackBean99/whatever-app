import 'package:flutter/material.dart';
import 'package:whatever/utils/app_radius.dart';
import 'package:whatever/utils/bottom_sheet_options.dart';

class CustomBottomSheet extends StatelessWidget {
  final BottomSheetType type;
  final BuildContext context;

  const CustomBottomSheet({
    super.key,
    required this.type,
    required this.context,
  });

  void show() {
    switch (type) {
      case BottomSheetType.modal:
        _showModalSheet();
        break;
      case BottomSheetType.persistent:
        _showPersistentSheet();
        break;
      case BottomSheetType.scrollable:
        _showScrollableSheet();
        break;
      case BottomSheetType.fullscreen:
        _showFullscreenSheet();
        break;
      case BottomSheetType.adaptive:
        _showAdaptiveSheet();
        break;
      case BottomSheetType.dismissible:
        _showDismissibleSheet();
        break;
    }
  }

  void _showModalSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circular20,
      ),
      builder: (context) => _buildContent('Modal Bottom Sheet'),
    );
  }

  void _showPersistentSheet() {
    Scaffold.of(context).showBottomSheet(
      (context) => _buildContent('Persistent Bottom Sheet'),
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circular20,
      ),
    );
  }

  void _showScrollableSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circular20,
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.25,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: _buildScrollableContent(),
        ),
      ),
    );
  }

  void _showFullscreenSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height,
        child: _buildContent('Fullscreen Bottom Sheet'),
      ),
    );
  }

  void _showAdaptiveSheet() {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (context) => _buildContent('Adaptive Bottom Sheet'),
    );
  }

  void _showDismissibleSheet() {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circular20,
      ),
      builder: (context) => _buildContent('Dismissible Bottom Sheet'),
    );
  }

  Widget _buildContent(String title) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: AppRadius.circular10,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text('This is a ${type.displayName} bottom sheet example'),
        ],
      ),
    );
  }

  Widget _buildScrollableContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: AppRadius.circular10,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Scrollable Bottom Sheet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(
            20,
            (index) => ListTile(
              title: Text('Item ${index + 1}'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
