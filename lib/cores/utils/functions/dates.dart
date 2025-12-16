import 'package:flutter/material.dart';
import 'package:food_court/cores/utils/extensions/strings.dart';
import 'package:intl/intl.dart';
import '../enums/week_days.dart';
import '../enums/year_months.dart';
import 'number_form.dart';

class AppDates{
  static String monthDayYear(DateTime dateTime) {
    return "${Months.values[dateTime.month - 1].name} ${dateTime.day}, ${dateTime.year}";
  }

  static String dayName(DateTime dateTime) {
    return Days.values[dateTime.weekday - 1].name;
  }

  static String customDateForm(DateTime dateTime) {
    return "${dateTime.year}-${NumberForm.twoCells(dateTime.month)}-${NumberForm.twoCells(dateTime.day)}";
  }

  static String foodCourtDateForm(DateTime dateTime) {
    return "${NumberForm.twoCells(dateTime.day)} "
        "${Months.values[dateTime.month-1].name.substring(0,3).characterUpper}, "
        "${NumberForm.twoCells(dateTime.hour)}:"
        "${NumberForm.twoCells(dateTime.minute)}";
  }

  static String customTimeForm(DateTime time) {
    DateTime dateTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      time.hour,
      time.minute,
    );
    DateFormat formatter = DateFormat('hh:mm a');
    String formattedTime = formatter.format(dateTime);
    return formattedTime;
  }

  static DateTime textToDate(String? dateInput) {
    if (dateInput == null || dateInput.trim().isEmpty) {
      // default fallback (e.g., now)
      return DateTime.now();
    }
    try {
      DateFormat dateFormat = DateFormat("yyyy-MM-dd");
      DateTime date = dateFormat.parseStrict(dateInput.trim());
      return date;
    } catch (e) {
      debugPrint("⚠️ Failed to parse date: '$dateInput' -> $e");
      // fallback to now or custom default
      return DateTime.now();
    }
  }

  static DateTime dateAndTime(DateTime date, TimeOfDay time) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  static bool isToday(DateTime dayDate) {
    return dayDate.year == DateTime.now().year &&
        dayDate.month == DateTime.now().month &&
        dayDate.day == DateTime.now().day;
  }

  static bool isTomorrow(DateTime dayDate) {
    return dayDate.year == DateTime.now().year &&
        dayDate.month == DateTime.now().month &&
        dayDate.day == DateTime.now().day + 1;
  }

  static bool isYesterday(DateTime dayDate) {
    return dayDate.year == DateTime.now().year &&
        dayDate.month == DateTime.now().month &&
        dayDate.day == DateTime.now().day - 1;
  }

  static String dayState(DateTime dayDate) {
    if (isToday(dayDate)) {
      return "Today";
    } else if (isTomorrow(dayDate)) {
      return "Tomorrow";
    } else if (isYesterday(dayDate)) {
      return "yesterday";
    } else {
      return customDateForm(dayDate);
    }
  }

  static DateTime dayDate() {
    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
  }
}
