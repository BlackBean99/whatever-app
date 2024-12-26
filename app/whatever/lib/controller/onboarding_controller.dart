import 'package:flutter/material.dart';

class OnboardingController extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  void goToPage(int index) {
    _currentPage = index;
    notifyListeners();
  }
}
