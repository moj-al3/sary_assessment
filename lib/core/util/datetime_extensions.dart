import 'package:intl/intl.dart';
//add extra function to the DateTime Class
extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  String formateDate(DateTime? dateToFormat, bool includeTime) {
    if (dateToFormat == null) return "";
    if (includeTime) {
      return DateFormat('yyyy-MM-dd hh:mm a').format(dateToFormat);
    } else {
      return DateFormat('yyyy-MM-dd').format(dateToFormat);
    }
  }
}
