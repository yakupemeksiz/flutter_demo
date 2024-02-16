import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  /// Output: [28.01.2024]
  String toFormattedString() {
    return DateFormat('dd.MM.yyyy').format(this);
  }
}
