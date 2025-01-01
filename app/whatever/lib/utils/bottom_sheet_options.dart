enum BottomSheetType {
  modal,
  persistent,
  scrollable,
  fullscreen,
  adaptive,
  dismissible
}

extension BottomSheetTypeExtension on BottomSheetType {
  String get displayName {
    switch (this) {
      case BottomSheetType.modal:
        return 'Modal';
      case BottomSheetType.persistent:
        return 'Persistent';
      case BottomSheetType.scrollable:
        return 'Scrollable';
      case BottomSheetType.fullscreen:
        return 'Fullscreen';
      case BottomSheetType.adaptive:
        return 'Adaptive';
      case BottomSheetType.dismissible:
        return 'Dismissible';
    }
  }
}
