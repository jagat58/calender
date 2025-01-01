
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthWidget extends StatefulWidget {
  final DateTime focusedDay;
  final Function(DateTime) onPageChanged;

  const MonthWidget({super.key, required this.focusedDay, required this.onPageChanged});

  @override
  _MonthWidgetState createState() => _MonthWidgetState();
}

class _MonthWidgetState extends State<MonthWidget> {
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0C78C0), Color(0xFF1F03AC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(2010, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: widget.focusedDay,
        calendarFormat: CalendarFormat.month,
        headerVisible: false,
        availableGestures: AvailableGestures.horizontalSwipe,
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.white),
          weekendStyle: TextStyle(color: Colors.white),
        ),
        calendarStyle: CalendarStyle(
          todayDecoration: const BoxDecoration(
            color: Color.fromARGB(255, 236, 186, 186),
            shape: BoxShape.rectangle,
          ),
          selectedDecoration: const BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.rectangle,
          ),
          defaultDecoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.rectangle,
          ),
          weekendDecoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.rectangle,
          ),
          defaultTextStyle: const TextStyle(color: Colors.white),
          weekendTextStyle: const TextStyle(color: Colors.white),
          withinRangeDecoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
          ),
          withinRangeTextStyle: const TextStyle(color: Colors.black),
          rangeHighlightColor: Colors.white.withOpacity(0.3),
          rangeStartDecoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            shape: BoxShape.rectangle,
          ),
          rangeEndDecoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            shape: BoxShape.rectangle,
          ),
        ),
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
          });
        },
        onPageChanged: widget.onPageChanged,
        rangeStartDay: widget.focusedDay.subtract(Duration(days: widget.focusedDay.weekday - 1)),
        rangeEndDay: widget.focusedDay.add(Duration(days: DateTime.saturday - widget.focusedDay.weekday)),
      ),
    );
  }
}
