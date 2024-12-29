import 'package:flutter/material.dart';

class CalendarProvider extends ChangeNotifier {
  DateTime _currentDate = DateTime.now();

  DateTime get currentDate => _currentDate;

  void updateMonth(DateTime newDate) {
    _currentDate = newDate;
    notifyListeners();
  }

  void goToPreviousMonth() {
    _currentDate = DateTime(
      _currentDate.year,
      _currentDate.month - 1,
    );
    notifyListeners();
  }

  void goToNextMonth() {
    _currentDate = DateTime(
      _currentDate.year,
      _currentDate.month + 1,
    );
    notifyListeners();
  }
}
