import 'package:iloilocityapp/app/global/utils/date_patterns.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toStringDate({String format = DatePatterns.yMd}) {
    return DateFormat(format).format(this).toString();
  }
}
