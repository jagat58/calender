class CalendarModel {
  final int year;
  final String month;
  final List<List<int?>> days;
  final DateTime date;

  CalendarModel(this.year, this.month, this.days, this.date);

  static List<List<int?>> generateMonthDays(int daysInMonth) {
    List<List<int?>> weeks = [];
    List<int?> currentWeek = [];
    for (int i = 1; i <= daysInMonth; i++) {
      currentWeek.add(i);
      if (currentWeek.length == 7 || i == daysInMonth) {
        weeks.add(currentWeek);
        currentWeek = [];
      }
    }
    return weeks;
  }

CalendarModel copyWith({
  int? year,
  String? month,
  List<List<int?>>? days,
  DateTime? date,
}) {
  return CalendarModel(
    year ?? this.year,
    month ?? this.month,
    days ?? this.days,
    date ?? this.date,
  );
}

}