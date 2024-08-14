import 'package:intl/intl.dart';

final formatter = DateFormat.yMMMd();

class DateUtil {
  static String formatDate(DateTime date) {
    return formatter.format(date);
  }
}
