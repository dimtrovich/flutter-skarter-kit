import 'package:intl/intl.dart';

class Formatter {
  static String? date(DateTime? date, {String format = 'dd MMM yyyy - HH:mm'}) {
    if (date == null) {
      return null;
    }
    return DateFormat(format).format(date);
  }

  static String price(num price, {String devise = ' F'}) {
    var f = NumberFormat('###,###,###,###');

    return "${f.format(price)} $devise";
  }
}
