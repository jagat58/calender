import '../models/calendar_models.dart';

class CalendarController {
  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  CalendarModel getMonthData(int month, int year) {
    final daysInMonth = DateTime(year, month + 1, 0).day;
    final days = CalendarModel.generateMonthDays(daysInMonth);
    return CalendarModel(year, months[month - 1], days , DateTime(year, month, 1));
  }
}
