// ignore_for_file: constant_identifier_names

class Constants {
  static const String API_URL = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://jsonplaceholder.typicode.com/',
  );
  static const String ACCESS_TOKEN_KEY = "APP_ACCESSTOKEN";
  static const String USER_INFOS_KEY = "APP_USER";
  static const String ALREADY_OPEN_KEY = "already-open";

  // Transverse preferences (Theme, Locale, Currency, Active Mode)
  static const String THEME_MODE_KEY = "APP_THEME_MODE";
  static const String LOCALE_KEY = "APP_LOCALE";
  static const String CURRENCY_KEY = "APP_CURRENCY";
  static const String ACTIVE_MODE_KEY = "APP_ACTIVE_MODE";

  static const String appTitle = "Starter Kit";
  static const String appTagline =
      "Votre kit de démarrage pour réussir vos projets.";
  static const int splashDelaySeconds = 3;

  // Business constants (§3 & §7)
  static const String defaultCurrency = "XAF";
  static const String defaultLanguage = "fr";

  static const String imagePath = "assets/img/";
  static const String iconPath = "assets/icons/";
}

typedef AppConstants = Constants;
