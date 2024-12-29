import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/calender_provider.dart';
import '../models/calendar_models.dart';
import 'month_widget.dart';

class MonthSlider extends StatelessWidget {
  final CalendarModel monthData;

  const MonthSlider({super.key, required this.monthData});

  @override
  Widget build(BuildContext context) {
    final calendarProvider = Provider.of<CalendarProvider>(context);

    return PageView.builder(
      controller: PageController(initialPage: 0),
      onPageChanged: (index) {
        final currentMonth = calendarProvider.currentDate.month;
        final currentYear = calendarProvider.currentDate.year;
        final newDate = DateTime(
          currentYear,
          currentMonth + index,
        );
        calendarProvider.updateMonth(newDate);
      },
      itemBuilder: (context, index) {
        final currentMonth = calendarProvider.currentDate.month;
        final currentYear = calendarProvider.currentDate.year;

        final newDate = DateTime(
          currentYear,
          currentMonth + index,
          1,
        );

        return MonthWidget(monthData: monthData.copyWith(date: newDate));
      },
    );
  }
}
