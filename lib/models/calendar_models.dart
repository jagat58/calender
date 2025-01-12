class CalendarModel {
  int month;
  int year;

  CalendarModel({required this.month, required this.year});

  String getMonthName() {
    const List<String> nepaliMonthNames = [
      'बैशाख', 'जेठ', 'असार', 'साउन', 'भदौ', 'असोज',
      'कार्तिक', 'मंसिर', 'पुष', 'माघ', 'फाल्गुन', 'चैत्र'
    ];
    return nepaliMonthNames[month - 1];
  }

  String getAstrologicalDayName(int dayNumber) {
    const List<String> astrologicalDayNames = [
      'प्रतिपदा', 
    ];
    if (dayNumber < 1 || dayNumber > astrologicalDayNames.length) {
      return 'Invalid day number';
    }
    return astrologicalDayNames[dayNumber - 1];
  }

  Map<int, String> getHinduFestivalsForMonth(int month) {
    Map<int, List<String>> hinduFestivals = {
      1: ['मकर संक्रान्ति', 'पोंगल'],
      2: ['महाशिवरात्रि'],
      3: ['होली'],
      4: ['राम नवमी'],
      5: ['अक्षय तृतीया'],
      6: ['गंगा दशहरा'],
      7: ['गुरु पूर्णिमा'],
      8: ['रक्षा बन्धन', 'जन्माष्टमी'],
      9: ['गणेश चतुर्थी'],
      10: ['नवरात्रि', 'दशहरा'],
      11: ['दीपावली', 'भाई दूज'],
      12: ['गीता जयंती']
    };

    return {for (var festival in hinduFestivals[month] ?? []) month: festival};
  }

  String getEnglishDate(DateTime date) {
    return "${date.day}-${date.month}-${date.year}";
  }

  void updateMonthAndYear(int newMonth, int newYear) {
    month = newMonth;
    year = newYear;
  }
}

String getWeekDayName(int dayNumber) {
  const List<String> nepaliWeekDayNames = [
    'आइत', 'सोम', 'मंगल', 'बुध', 'बिही', 'शुक्र', 'शनि'
  ];
  if (dayNumber < 0 || dayNumber > 6) {
    throw RangeError.range(dayNumber, 0, 6, 'dayNumber');
  }
  return nepaliWeekDayNames[dayNumber];
}