import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:starter_kit/entities/currency.dart';
import 'package:starter_kit/utils/constants.dart';
import 'package:starter_kit/utils/store.dart';

class CurrencyService extends GetxController {
  static CurrencyService get to => Get.find<CurrencyService>();

  final List<Currency> supportedCurrencies = const [
    Currency(
      code: 'XAF',
      symbol: 'FCFA',
      name: 'Franc CFA (CEMAC)',
      decimalPlaces: 0,
      rateFromXaf: 1.0,
    ),
    Currency(
      code: 'XOF',
      symbol: 'CFA',
      name: 'Franc CFA (UEMOA)',
      decimalPlaces: 0,
      rateFromXaf: 1.0,
    ),
    Currency(
      code: 'NGN',
      symbol: '₦',
      name: 'Naira Nigérian',
      decimalPlaces: 0,
      rateFromXaf: 2.65,
    ),
    Currency(
      code: 'EUR',
      symbol: '€',
      name: 'Euro',
      decimalPlaces: 2,
      rateFromXaf: 0.001524,
    ),
    Currency(
      code: 'USD',
      symbol: '\$',
      name: 'US Dollar',
      decimalPlaces: 2,
      rateFromXaf: 0.00165,
    ),
  ];

  final Rx<Currency> activeCurrency = const Currency(
    code: 'XAF',
    symbol: 'FCFA',
    name: 'Franc CFA (CEMAC)',
    decimalPlaces: 0,
    rateFromXaf: 1.0,
  ).obs;

  Future<CurrencyService> init() async {
    final savedCode = await Store.getString(Constants.CURRENCY_KEY);
    if (savedCode != null) {
      final match = supportedCurrencies.firstWhereOrNull((c) => c.code == savedCode);
      if (match != null) {
        activeCurrency.value = match;
      }
    }
    return this;
  }

  Future<void> setCurrency(String code) async {
    final match = supportedCurrencies.firstWhereOrNull((c) => c.code == code);
    if (match != null) {
      activeCurrency.value = match;
      await Store.set(Constants.CURRENCY_KEY, match.code);
      update();
    }
  }

  /// Convertit un montant exprimé en XAF vers la devise active et le formate
  String format(num amountInXaf, {String? forceCurrencyCode}) {
    final Currency target = forceCurrencyCode != null
        ? (supportedCurrencies.firstWhereOrNull((c) => c.code == forceCurrencyCode) ?? activeCurrency.value)
        : activeCurrency.value;

    final double converted = amountInXaf * target.rateFromXaf;
    final pattern = target.decimalPlaces > 0 ? '#,##0.00' : '###,###,###,###';
    final formatted = NumberFormat(
      pattern,
      'fr_FR',
    ).format(converted).replaceAll(',', ' ');

    if (target.code == 'USD' || target.code == 'NGN') {
      return '${target.symbol}$formatted';
    }
    return '$formatted ${target.symbol}';
  }
}
