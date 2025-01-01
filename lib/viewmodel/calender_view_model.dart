import 'package:flutter/material.dart';
import '../models/calendar_models.dart';

class CalendarViewModel extends ChangeNotifier {
  final CalendarModel _calendarModel;
  DateTime _focusedDay = DateTime.now();

  CalendarViewModel() : _calendarModel = CalendarModel(month: DateTime.now().month, year: DateTime.now().year);

  DateTime get focusedDay => _focusedDay;
  String get monthName => _calendarModel.getMonthName();
  String get astrologicalDayName => _calendarModel.getAstrologicalDayName(_focusedDay.day);
  Map<int, String> get festivalsForMonth => _calendarModel.getHinduFestivalsForMonth(_focusedDay.month);

  void onDaySelected(DateTime selectedDay) {
    _focusedDay = selectedDay;
    notifyListeners();
  }

  String getEnglishDate(DateTime date) {
    return _calendarModel.getEnglishDate(date);
  }
}
