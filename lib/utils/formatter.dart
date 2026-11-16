import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:starter_kit/services/currency_service.dart';

class Formatter {
  static String? date(DateTime? date, {String format = 'dd MMM yyyy - HH:mm'}) {
    if (date == null) {
      return null;
    }
    return DateFormat(format).format(date);
  }

  static String price(num price, {String? devise}) {
    if (devise == null && Get.isRegistered<CurrencyService>()) {
      return CurrencyService.to.format(price);
    }
    var f = NumberFormat('###,###,###,###', 'fr_FR');
    return "${f.format(price).replaceAll(',', ' ')} ${devise ?? 'FCFA'}";
  }
}
